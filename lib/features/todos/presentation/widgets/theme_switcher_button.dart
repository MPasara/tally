import 'package:flutter/material.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

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
          width: double.infinity, // fill the Expanded space, don't hug content
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: colors.accentTintFill,
            border: isSelected ? Border.all(color: colors.accent) : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 2),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
