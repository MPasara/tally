import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

enum AppThemeMode { light, dark, system }

@singleton
class ThemeCubit extends Cubit<AppThemeMode> {
  ThemeCubit() : super(AppThemeMode.system);

  void setLight() => emit(AppThemeMode.light);
  void setDark() => emit(AppThemeMode.dark);
  void setSystem() => emit(AppThemeMode.system);

  ThemeMode get flutterThemeMode => switch (state) {
    AppThemeMode.light => ThemeMode.light,
    AppThemeMode.dark => ThemeMode.dark,
    AppThemeMode.system => ThemeMode.system,
  };
}
