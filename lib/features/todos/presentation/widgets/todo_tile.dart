import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/features/todos/domain/entities/todo.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/delete_todo_dialog.dart';
import 'package:tally_mobile/generated/l10n.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.colors, required this.todo});

  final TallyColors colors;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colors.border),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: todo.completed,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    onChanged: (_) {
                      // TODO: wire up toggle-complete cubit later
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    if (todo.description.isNotEmpty)
                      Text(
                        todo.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: colors.accentTintFill,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            todo.urgency.label(context),
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: colors.accentText,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${S.of(context).due}: ${DateFormat('MM.dd.yyyy').format(todo.dueDate)}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: colors.secondaryText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteTodoDialog();
                    },
                  );
                },
                icon: Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
