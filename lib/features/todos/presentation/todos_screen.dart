import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tally_mobile/app/core/service_locator.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/features/todos/presentation/logic/blocs/todo_bloc.dart';
import 'package:tally_mobile/features/todos/presentation/logic/blocs/todo_events.dart';
import 'package:tally_mobile/features/todos/presentation/logic/cubits/create_todo_cubit.dart';
import 'package:tally_mobile/features/todos/presentation/logic/state/todo_state.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/add_todo_bottom_sheet.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/tally_drawer.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/todo_tile.dart';
import 'package:tally_mobile/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TodoBloc>()..add(const LoadTodos()),
      child: const _TodosView(),
    );
  }
}

class _TodosView extends StatelessWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TallyColors>()!;

    return BlocListener<TodoBloc, TodoState>(
      listenWhen: (previous, current) {
        if (current is! TodoLoaded) return false;
        if (previous is! TodoLoaded) return true;
        return previous.lastAction != current.lastAction;
      },
      listener: (context, state) {
        final action = (state as TodoLoaded).lastAction;
        if (action == null) return;

        if (action.isSuccess) {
          toastification.show(
            style: ToastificationStyle.minimal,
            showProgressBar: true,
            title: Text(S.of(context).todo_deleted),
            autoCloseDuration: const Duration(seconds: 2),
            type: ToastificationType.info,
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(action.failure!.title)));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        endDrawer: TallyDrawer(),
        appBar: AppBar(
          title: Text(S.of(context).todos, style: TextStyle(fontSize: 22)),
          centerTitle: false,
          backgroundColor: colors.bg,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: colors.accent, style: BorderStyle.solid),
          ),
          child: FloatingActionButton(
            backgroundColor: colors.navBar,
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                enableDrag: true,
                showDragHandle: true,
                builder: (_) => BlocProvider(
                  create: (_) => sl<CreateTodoCubit>(),
                  child: const AddTodoBottomSheet(),
                ),
              );
              if (context.mounted) {
                context.read<TodoBloc>().add(const LoadTodos());
              }
            },
            child: Icon(Icons.add, color: colors.accent),
          ),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return switch (state) {
              TodoInitial() ||
              TodoLoading() => const Center(child: CircularProgressIndicator()),
              TodoError(:final failure) => Center(child: Text(failure.title)),
              TodoLoaded(:final todos) when todos.isEmpty => Center(
                child: Text(S.of(context).no_todos),
              ),
              TodoLoaded(:final todos) => RefreshIndicator(
                onRefresh: () async =>
                    context.read<TodoBloc>().add(const RefreshTodos()),
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        top: index == 0 ? 0 : 4,
                        bottom: 4,
                        left: 14,
                        right: 14,
                      ),
                      child: TodoTile(colors: colors, todo: todo),
                    );
                  },
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
