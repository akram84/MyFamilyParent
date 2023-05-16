
import '../utils/app_local_storage.dart';

class LanguageRepository{
  static const String language = 'language';

  static Future<bool> saveLang(String lang) async => AppLocalStorage.saveData(key: language, value: lang);
  static String get getLang  => AppLocalStorage.getData(key: language)??'en';
}