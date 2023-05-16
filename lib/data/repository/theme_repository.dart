
import '../utils/app_local_storage.dart';

class ThemeRepository{
  static const String themeKey = 'theme';

  static Future<bool> saveTheme(String theme) async => AppLocalStorage.saveData(key: themeKey, value: theme);
  static String? get getTheme  => AppLocalStorage.getData(key: themeKey);
}