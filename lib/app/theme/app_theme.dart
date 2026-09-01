import 'package:flutter/material.dart';
import 'package:tally_mobile/app/theme/tally_colors.dart';

class AppTheme {
  static ThemeData get lightTheme =>
      _base(brightness: Brightness.light, colors: TallyColors.light);

  static ThemeData get darkTheme =>
      _base(brightness: Brightness.dark, colors: TallyColors.dark);

  static ThemeData _base({
    required Brightness brightness,
    required TallyColors colors,
  }) {
    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: colors.bg,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.accent,
        onPrimary: brightness == Brightness.dark ? colors.bg : Colors.white,
        secondary: colors.accentIcon,
        onSecondary: colors.accentText,
        error: brightness == Brightness.dark
            ? const Color(0xFFE57373)
            : const Color(0xFFB3261E),
        onError: Colors.white,
        surface: colors.surface,
        onSurface: colors.text,
      ),
      dividerColor: colors.rule,
      drawerTheme: DrawerThemeData(backgroundColor: colors.surface),
      dialogTheme: DialogThemeData(backgroundColor: colors.sheetOrDoneTile),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.sheetOrDoneTile,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
        ),
      ),
      textTheme: _textTheme(colors),
    );

    return base.copyWith(extensions: [colors]);
  }

  static TextTheme _textTheme(TallyColors colors) {
    return TextTheme(
      headlineMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 26,
        height: 1.1,
        letterSpacing: -0.02 * 26,
        color: colors.text,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.3,
        color: colors.text,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 14.5,
        height: 1.65,
        color: colors.bodyCopy,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 10,
        letterSpacing: 0.09 * 10,
        color: colors.muted,
      ),
      // add the rest of the type scale from section 3 of the spec as needed
    );
  }
}
