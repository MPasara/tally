import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tally_mobile/generated/l10n.dart';

//import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteTodoDialog extends StatelessWidget {
  const DeleteTodoDialog({super.key});

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
              //context.read<TodoCubit>().deleteTodo(todo.id);
            },
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(Colors.red.shade400),
              overlayColor: WidgetStatePropertyAll(Colors.red.shade50),
              surfaceTintColor: WidgetStatePropertyAll(Colors.red.shade400),
            ),
            child: Text('Delete'),
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
