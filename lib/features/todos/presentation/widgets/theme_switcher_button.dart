import 'package:flutter/material.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const new({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TallyColors>()!;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          decoration: BoxDecoration(
            border: Border.all(color: colors.accent),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [icon, Text(label)],
          ),
        ),
      ),
    );
  }
}
