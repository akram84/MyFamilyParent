import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalizations{
  AppLocalizations(this.locale);
  final Locale locale;
  static const Locale arLocale = Locale('ar', 'EG');
  static const Locale enLocale = Locale('en', 'US');

  static AppLocalizations of(BuildContext context){
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  Map<String, String> _localizedStrings = <String, String>{};
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Future<dynamic> load() async{
    final String jsonString = await rootBundle.loadString('assets/locales/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, value) => MapEntry<String, String>(key, value.toString()));
    
  }

  String translate(String key) {
    if (_localizedStrings.containsKey(key)) {
      return _localizedStrings[key]!;
    }
    return key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations>{
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return <String>['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async{
    // AppLocalizations class is where the JSON loading actually runs
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;

  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}