import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tally_mobile/app/theme/logic/theme_cubit.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/theme_switcher_button.dart';

class TallyDrawer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TallyColors>()!;
    final selectedTheme = context.watch<ThemeCubit>().selectedThemeMode;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: Drawer(
        backgroundColor: colors.bg,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Settings'),
                    Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ThemeSwitcherButton(
                      icon: Icon(Icons.light_mode_outlined),
                      label: 'Light',
                      isSelected: selectedTheme.isLight,
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context.read<ThemeCubit>().setLight();
                      },
                    ),
                    SizedBox(width: 6),
                    ThemeSwitcherButton(
                      icon: Icon(Icons.phone_android_outlined),
                      label: 'System',
                      isSelected: selectedTheme.isSystem,
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context.read<ThemeCubit>().setSystem();
                      },
                    ),
                    SizedBox(width: 6),
                    ThemeSwitcherButton(
                      icon: Icon(Icons.dark_mode_outlined),
                      isSelected: selectedTheme.isDark,
                      label: 'Dark',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        context.read<ThemeCubit>().setDark();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
