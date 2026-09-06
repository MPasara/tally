import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tally_mobile/app/core/service_locator.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/features/todos/presentation/logic/cubits/create_todo_cubit.dart';
import 'package:tally_mobile/features/todos/presentation/logic/cubits/get_todos_cubit.dart';
import 'package:tally_mobile/features/todos/presentation/logic/state/get_todos_state.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/add_todo_bottom_sheet.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/tally_drawer.dart';
import 'package:tally_mobile/generated/l10n.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GetTodosCubit>()..getAllTodos(),
      child: const _TodosView(),
    );
  }
}

class _TodosView extends StatelessWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TallyColors>()!;

    return Scaffold(
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
              context.read<GetTodosCubit>().getAllTodos();
            }
          },
          child: Icon(Icons.add, color: colors.accent),
        ),
      ),
      body: BlocBuilder<GetTodosCubit, GetTodosState>(
        builder: (context, state) {
          return switch (state) {
            GetTodosInitial() || GetTodosLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            GetTodosError(:final failure) => Center(child: Text(failure.title)),
            GetTodosLoaded(:final todos) when todos.isEmpty => const Center(
              child: Text('No todos yet'),
            ),
            GetTodosLoaded(:final todos) => RefreshIndicator(
              onRefresh: () async {
                await context.read<GetTodosCubit>().getAllTodos();
              },
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 14,
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      title: Text(todo.title),
                      tileColor: colors.surface,
                      subtitle: Text(todo.description),
                      trailing: Text(todo.urgency.name),
                      leading: Checkbox(
                        value: todo.completed,
                        onChanged: (_) {
                          // TODO: wire up toggle-complete cubit later
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          };
        },
      ),
    );
  }
}
