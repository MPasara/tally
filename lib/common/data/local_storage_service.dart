import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalStorageService {
  Future<String?> getThemeMode();
  Future<void> setThemeMode(String themeMode);
}

@LazySingleton(as: LocalStorageService)
class LocalStorageServiceImpl implements LocalStorageService {
  static const String _localeKey = 'app_locale';
  static const String _themeKey = 'theme_mode';

  @override
  Future<String?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey);
  }

  @override
  Future<void> setThemeMode(String themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_themeKey, themeMode);
  }
}
