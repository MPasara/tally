import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/common/data/repositories/theme_repository.dart';

enum AppThemeMode { light, dark, system }

@lazySingleton
class ThemeCubit extends Cubit<AppThemeMode> {
  ThemeCubit(this._repository) : super(AppThemeMode.system) {
    getAppTheme();
  }

  final ThemeRepsitory _repository;

  Future<void> getAppTheme() async {
    final result = await _repository.getThemeMode();
    result.fold(
      (failure) => debugPrint('Failed to load theme: ${failure.title}'),
      (themeMode) => emit(_toAppThemeMode(themeMode)),
    );
  }

  Future<void> setLight() => _setTheme(AppThemeMode.light);
  Future<void> setDark() => _setTheme(AppThemeMode.dark);
  Future<void> setSystem() => _setTheme(AppThemeMode.system);

  Future<void> _setTheme(AppThemeMode mode) async {
    final result = await _repository.setThemeMode(_toThemeMode(mode));
    result.fold(
      (failure) => debugPrint('Failed to save theme: ${failure.title}'),
      (_) => emit(mode),
    );
  }

  ThemeMode get flutterThemeMode => _toThemeMode(state);

  ThemeMode _toThemeMode(AppThemeMode mode) => switch (mode) {
    AppThemeMode.light => ThemeMode.light,
    AppThemeMode.dark => ThemeMode.dark,
    AppThemeMode.system => ThemeMode.system,
  };

  AppThemeMode _toAppThemeMode(ThemeMode mode) => switch (mode) {
    ThemeMode.light => AppThemeMode.light,
    ThemeMode.dark => AppThemeMode.dark,
    ThemeMode.system => AppThemeMode.system,
  };
}
