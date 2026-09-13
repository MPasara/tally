import 'package:flutter/material.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/features/todos/domain/task_urgency.dart';

class UrgencySelectorRow extends StatefulWidget {
  const UrgencySelectorRow({
    super.key,
    this.initialValue = TaskUrgency.low,
    required this.onChanged,
  });

  final TaskUrgency initialValue;
  final ValueChanged<TaskUrgency> onChanged;

  @override
  State<UrgencySelectorRow> createState() => _UrgencySelectorRowState();
}

class _UrgencySelectorRowState extends State<UrgencySelectorRow> {
  late TaskUrgency _selectedUrgency = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: TaskUrgency.values.map((urgency) {
        final isSelected = _selectedUrgency == urgency;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _UrgencyButton(
              label: urgency.label(context),
              isSelected: isSelected,
              onTap: () {
                setState(() => _selectedUrgency = urgency);
                widget.onChanged(urgency);
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _UrgencyButton extends StatelessWidget {
  const _UrgencyButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TallyColors>()!;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? colors.accentTintFill : colors.surface,
            border: Border.all(
              color: isSelected ? colors.accent : colors.border,
              width: isSelected ? 1.5 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSelected) ...[
                Icon(Icons.circle, size: 6, color: colors.accentText),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isSelected ? colors.accentText : colors.text,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
