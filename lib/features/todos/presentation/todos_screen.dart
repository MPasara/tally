import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tally_mobile/app/core/service_locator.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/features/todos/presentation/logic/cubits/create_todo_cubit.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/add_todo_bottom_sheet.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/tally_drawer.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TallyColors>()!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      endDrawer: TallyDrawer(),
      appBar: AppBar(
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
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,

              enableDrag: true,
              showDragHandle: true,
              builder: (_) => BlocProvider(
                create: (_) => sl<CreateTodoCubit>(),
                child: const AddTodoBottomSheet(),
              ),
            );
          },
          child: Icon(Icons.add, color: colors.accent),
        ),
      ),
      body: Center(child: Text('Todos')),
    );
  }
}
