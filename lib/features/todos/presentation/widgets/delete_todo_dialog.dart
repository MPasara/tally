import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tally_mobile/features/todos/presentation/logic/blocs/todo_bloc.dart';
import 'package:tally_mobile/features/todos/presentation/logic/blocs/todo_events.dart';
import 'package:tally_mobile/generated/l10n.dart';

class DeleteTodoDialog extends StatelessWidget {
  const DeleteTodoDialog({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: AlertDialog(
        title: Text(S.of(context).delete_todo),
        content: Text(S.of(context).delete_todo_desc),
        actions: [
          TextButton(
            onPressed: () {
              context.read<TodoBloc>().add(DeleteTodo(id));
              Navigator.of(context).pop();
              /* ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).todo_deleted)),
              ); */
            },
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.red.shade400),
              overlayColor: WidgetStatePropertyAll(Colors.red.shade50),
              surfaceTintColor: WidgetStatePropertyAll(Colors.red.shade400),
            ),
            child: Text(S.of(context).delete),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }
}
