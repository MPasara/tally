import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tally_mobile/common/data/repositories/theme_repository.dart';


@lazySingleton
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._repository) : super(ThemeMode.system) {
    getAppTheme();
  }

  final ThemeRepsitory _repository;

  Future<void> getAppTheme() async {
    final result = await _repository.getThemeMode();
    result.fold(
      (failure) => debugPrint('Failed to load theme: ${failure.title}'),
      (themeMode) => emit(themeMode),
    );
  }

  Future<void> setLight() => _setTheme(ThemeMode.light);
  Future<void> setDark() => _setTheme(ThemeMode.dark);
  Future<void> setSystem() => _setTheme(ThemeMode.system);

  Future<void> _setTheme(ThemeMode mode) async {
    final result = await _repository.setThemeMode(mode);
    result.fold(
      (failure) => debugPrint('Failed to save theme: ${failure.title}'),
      (_) => emit(mode),
    );
  }

  ThemeMode get selectedThemeMode => state;
}
