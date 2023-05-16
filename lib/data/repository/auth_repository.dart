import '../utils/app_local_storage.dart';

class AuthRepository{
  static const String _sharedPreferenceToken = "Token";
  final String _sharedPreferenceOnBoarding = "OnBoarding";
  String? get accessToken => _getToken();

  Future<void> setToken(String userToken) async {
    await AppLocalStorage.saveData(key: _sharedPreferenceToken, value: userToken);
  }

  String? _getToken(){
    return AppLocalStorage.getData(key: _sharedPreferenceToken);
  }

  static Future removeToken() async {
    await AppLocalStorage.removeData(_sharedPreferenceToken);
  }

  bool isOnBoarding(){
    return AppLocalStorage.getData(key: _sharedPreferenceOnBoarding) ?? true;
  }

  Future<void> setOnBoarding() async {
    await AppLocalStorage.saveData(key: _sharedPreferenceOnBoarding, value: false);
  }
}