import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:get/get.dart' ;
import 'package:my_family/core/utils/app_logger.dart';
import 'package:my_family/data/dto/account/edit_family_password.dart';
import 'package:my_family/data/dto/auth/login.dart';
import 'package:my_family/data/repository/auth_repository.dart';
import 'package:my_family/data/utils/api_path.dart';
import 'package:my_family/data/utils/app_local_storage.dart';
import 'package:my_family/ui/helper/app_toast.dart';
import 'package:my_family/ui/resources/app_strings.dart';

import '../../data/model/user.dart';
import '../dto/auth/register/register.dart';
import '../model/auth/auth.dart';
import '../model/auth/logout.dart';
import '../model/helper/helper_permissions.dart';
import '../utils/api_service.dart';

class UserRepository {
  static User? user;

  // Login api
  static Future<Auth?> login(LoginDTO loginDTO) async {
    AppLogger.warning('FAMILY: ${loginDTO.toJson()}');
    try {
      final response = await ApiService.postApi(ApiPaths.login, body: loginDTO.toJson());
      if (response.statusCode == 200 && response.data['success']) {
        Auth login = Auth.fromJson(response.data);

        await AuthRepository().setToken(login.token!);
        user = login.user;
        await saveUser(user!);

        AppToast.toast(msg: AppStrings.loginSuccess.tr);
        return login;
      } else {
        print('ERROR: ${response.data}');
        AppToast.toast(msg: response.data is Map ? response.data['error']??AppStrings.loginFail.tr : AppStrings.loginFail.tr);
        return null;
      }
    } on Exception catch (e) {
      print('ERROR: $e');
      AppToast.toast(msg: AppStrings.loginFail.tr);
      return null;
    }
  }

  static Future<bool> createAccount(RegisterDTO registerDTO) async {
    print(registerDTO.toJson());
    try {
    print(ApiPaths.register);
      final response = await ApiService.postApi(ApiPaths.register, body: registerDTO.toJson());
      if (response.statusCode! < 300 && response.data['success']) {
        AppToast.toast(msg: AppStrings.registerSuccess.tr);
        return true;
      } else {
        print('ERROR: ${response.data}');
        AppToast.toast(msg: response.data is Map ? response.data['error'] : AppStrings.registerFail.tr);
        return false;
      }
    } catch(e) {
      print('ERROR: $e');
      AppToast.toast(msg: AppStrings.registerFail.tr);
      return false;
    }
  }



  static List<PermissionData> getHelperPermissions() {
    return [
      PermissionData(id: 1, name: 'Entertainment'),
      PermissionData(id: 2, name: 'Control Tasks'),
      PermissionData(id: 3, name: 'Control Study'),
      PermissionData(id: 4, name: 'Control Events'),
    ];
  }

  static Future<bool> changePassword(EditPasswordDTO editPassword) async{
    try {
      final response = await ApiService.putApi(ApiPaths.changePassword, body: editPassword.toJson());
      AppLogger.warning(editPassword.toJson());
      if(response.statusCode! < 300){
        AppToast.toast(msg: response.data['message']??'Password Changed successfully');
      } else {
        AppToast.toast(msg: 'Couldn\'t Change Password');
      }
      return response.data['success'];
    } on Exception catch (e) {
      Logger.e(e.toString());
      AppToast.toast(msg: 'Couldn\'t Change Password');
      return false;
    }
  }
  static Future<Logout?> logout() async {
    try {
      final response = await ApiService.putApi(ApiPaths.logout, body: {'_id': user?.id});
      if (response.statusCode == 200) {
        Logout logout = Logout.fromJson(response.data);
        AppToast.toast(msg: logout.message??AppStrings.logoutSuccess.tr);
        AuthRepository.removeToken();
        removeUser();
        return logout;
      } else {
        print('ERROR: ${response.data}');
        AppToast.toast(msg: response.data is Map ? response.data['msg']??AppStrings.logoutFail.tr : AppStrings.logoutFail.tr);
        return null;
      }
    } on Exception catch (e) {
        print('ERROR: $e');
        AppToast.toast(msg: AppStrings.logoutFail.tr);
        return null;
    }
  }

  static Future<bool> deactivateAccount() async {
    try {
      final response = await ApiService.deleteApi(ApiPaths.deactivate);
      if (response.statusCode == 200) {
        AppToast.toast(msg: AppStrings.deactivateSuccess.tr);
        return response.data['success'];
      } else {
        AppToast.toast(msg: AppStrings.deactivateFailed.tr);
        return false;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      AppToast.toast(msg: AppStrings.deactivateFailed.tr);
      return false;
    }
  }


  static String userKey = 'user';
  static Future<void> saveUser(User user)async => await AppLocalStorage.saveData(key: userKey, value: user.toJson());
  static User? get getUser {
    final json = jsonDecode(AppLocalStorage.getData(key: userKey));
    user = json == null ? null : User.fromJson(json);
    print(user?.toJson());
    return user;
  }
  static void removeUser() => AppLocalStorage.removeData(userKey);
}
