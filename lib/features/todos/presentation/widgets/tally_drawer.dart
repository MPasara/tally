import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tally_mobile/app/theme/logic/locale_cubit.dart';
import 'package:tally_mobile/app/theme/logic/theme_cubit.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';
import 'package:tally_mobile/common/utils/language_constants.dart';
import 'package:tally_mobile/features/todos/presentation/widgets/theme_switcher_button.dart';
import 'package:tally_mobile/generated/l10n.dart';

class TallyDrawer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TallyColors>()!;
    final selectedTheme = context.watch<ThemeCubit>().selectedThemeMode;
    final selectedLocale = context.watch<LocaleCubit>().state;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: Drawer(
        backgroundColor: colors.bg,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 4, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      S.of(context).settings,
                      style: TextStyle(fontSize: 20),
                    ),
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
                    Expanded(
                      child: ThemeSwitcherButton(
                        icon: Icon(Icons.light_mode_outlined),
                        label: S.of(context).light,
                        isSelected: selectedTheme.isLight,
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          context.read<ThemeCubit>().setLight();
                        },
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: ThemeSwitcherButton(
                        icon: Icon(Icons.phone_android_outlined),
                        label: S.of(context).system,
                        isSelected: selectedTheme.isSystem,
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          context.read<ThemeCubit>().setSystem();
                        },
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: ThemeSwitcherButton(
                        icon: Icon(Icons.dark_mode_outlined),
                        isSelected: selectedTheme.isDark,
                        label: S.of(context).dark,
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          context.read<ThemeCubit>().setDark();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: colors.muted),
                RadioGroup<String>(
                  groupValue: selectedLocale.languageCode,
                  onChanged: (newLocale) {
                    if (newLocale != null) {
                      context.read<LocaleCubit>().changeLocale(newLocale);
                    }
                    HapticFeedback.mediumImpact();
                  },
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        S.of(context).language,
                        style: TextStyle(fontSize: 20),
                      ),
                      RadioListTile<String>(
                        value: LanguageConstants.eng,
                        title: Text(S.of(context).english),
                      ),
                      // const Divider(),
                      RadioListTile<String>(
                        value: LanguageConstants.cro,
                        title: Text(S.of(context).croatian),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
