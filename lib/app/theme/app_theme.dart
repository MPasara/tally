import 'package:flutter/material.dart';
import 'package:tally_mobile/app/theme/palette.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      drawerTheme: DrawerThemeData(backgroundColor: nocturneLightSurface),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}
