import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/data/repository/auth_repository.dart';
import 'package:my_family/data/repository/language_repository.dart';
import 'package:my_family/data/repository/theme_repository.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_routes.dart';

import '../../data/repository/user_repository.dart';
import '../../data/utils/app_local_storage.dart';

class AppHelper {
  static String? getCurrentUserToken() {
    return AuthRepository().accessToken;
  }

  // static User? getCurrentFamilyUser() {
  //   if (AppLocalStorage.getFamilyData(key: Const.KEY_FAMILY_USER_DATA) != null) {
  //     return AppLocalStorage.getFamilyData(key: Const.KEY_FAMILY_USER_DATA);
  //   } else {
  //     return null;
  //   }
  // }

  // static Helper? getCurrentHelperUser() {
  //   if (AppLocalStorage.getHelperData(key: Const.KEY_HELPER_USER_DATA) != null) {
  //     return AppLocalStorage.getHelperData(key: Const.KEY_HELPER_USER_DATA);
  //   } else {
  //     return null;
  //   }
  // }

  // static Child? getCurrentChildUser() {
  //   if (AppLocalStorage.getChildData(key: Const.KEY_CHILD_USER_DATA) != null) {
  //     return AppLocalStorage.getChildData(key: Const.KEY_CHILD_USER_DATA);
  //   } else {
  //     return null;
  //   }
  // }

  // static String? getUserType() {
  //   if (AppLocalStorage.getData(key: Const.KEY_USER_TYPE) != null) {
  //     return AppLocalStorage.getData(key: Const.KEY_USER_TYPE);
  //   } else {
  //     return null;
  //   }
  // }


  static Locale getAppLocale() => Locale(LanguageRepository.getLang);

  static Color getAppTheme() {
      String? theme = ThemeRepository.getTheme;
    if (theme != null && theme != "") {
      if (theme == Const.KEY_THEME_DEFAULT) {
        return AppColors.colorAppMain;
      } else if (theme == Const.KEY_THEME_BLUE) {
        return AppColors.blue;
      } else if (theme == Const.KEY_THEME_GREEN) {
        return AppColors.colorGreen;
      } else if (theme == Const.KEY_THEME_YALLOW) {
        return AppColors.colorYellow;
      } else if (theme == Const.KEY_THEME_DARK) {
        return AppColors.colorDark;
      } else if (theme == Const.KEY_THEME_RED) {
        return AppColors.colorRed;
      } else if (theme == Const.KEY_THEME_DARK_BLUE) {
        return AppColors.colorDarkBlue;
      } else if (theme == Const.KEY_THEME_BROWN) {
        return AppColors.colorBrown;
      } else if (theme == Const.KEY_THEME_ORANGE) {
        return AppColors.colorOrang;
      }
    }
    return AppColors.colorAppMain;
  }
  
  static Future saveDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      AppLocalStorage.saveData(
          key: Const.KEY_DEVICE_NAME, value: androidInfo.model);
      print('Running on Android ${androidInfo.model}'); // e.g. "Moto G (4)"
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      AppLocalStorage.saveData(
          key: Const.KEY_DEVICE_NAME, value: iosInfo.utsname.machine);
      print('Running on IOS ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
    }
  }

  static String getDeviceName() {
    if (AppLocalStorage.getData(key: Const.KEY_DEVICE_NAME) != null) {
      return AppLocalStorage.getData(key: Const.KEY_DEVICE_NAME);
    } else {
      return '';
    }
  }

  static TextAlignVertical getTextAlignVertical(){
    return LanguageRepository.getLang == 'ar' ? TextAlignVertical.bottom : TextAlignVertical.center;
  }


  static showSnackBar({required String title, required String message}){
    Get.snackbar(
        title.tr,
        duration:
        const Duration(milliseconds: 2000),
        backgroundColor:
        Colors.grey.withOpacity(0.1),
        margin: const EdgeInsets.all(20),
        message.tr);
  }

  static RegExp emailValidate() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  }

  static String? validateFamilyName({required String familyName}) {
    if (familyName.isEmpty) {
      return 'enter_your_family_name'.tr;
    } else {
      return null;
    }
  }

  static String? validateUserName({required String name}) {
    if (name.isEmpty) {
      return 'enter_username'.tr;
    } else {
      return null;
    }
  }

  static String? validatePhone({required String phone}) {
    if (phone.isEmpty) {
      return 'enter_phone'.tr;
    } else {
      return null;
    }
  }

  static String? validatePassword({required String password}) {
    if (GetUtils.isBlank(password)!) {
      return 'enter_password'.tr;
    } else if (password.length < 6) {
      return 'validate_password'.tr;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(
      {required String password, required String conformPassword}) {
    if (GetUtils.isBlank(conformPassword)!) {
      return 'Enter Confirm Password'.tr;
    } else if (conformPassword.length < 6) {
      return 'Password must be more than 6 characters'.tr;
    } else if (password != conformPassword) {
      return 'Passwords do not match'.tr;
    }
    return null;
  }

  static String? validateEmail({required email}) {
    if (GetUtils.isBlank(email)!) {
      return 'enter email'.tr;
    } else if (!AppHelper.emailValidate().hasMatch(email)) {
      return 'Enter a valid email'.tr;
    } else {
      return null;
    }
  }

  static String formatImage(String pathImage) {
    if (pathImage.contains('\\')) {
      return pathImage.replaceAll('\\', '/');
    } else {
      return pathImage;
    }
  }

  static String getUserImage(String pathImage) {
    // print('getUserImage: $pathImage');
    if (pathImage.contains(Const.imagePath)) {
      return formatImage(pathImage);
    } else {
      return formatImage('${Const.imagePath}$pathImage');
    }
  }

  static String getUserLatitude() {
    print(
        'getUserLatitude :${AppLocalStorage.getData(key: Const.KEY_CURRENT_LATITUDE)}');
    if (AppLocalStorage.getData(key: Const.KEY_CURRENT_LATITUDE) != null) {
      return AppLocalStorage.getData(key: Const.KEY_CURRENT_LATITUDE)
          .toString();
    } else {
      return '';
    }
  }

  static String getUserLongitude() {
    print(
        'getUserLongitude :${AppLocalStorage.getData(key: Const.KEY_CURRENT_LONGITUD)}');
    if (AppLocalStorage.getData(key: Const.KEY_CURRENT_LONGITUD) != null) {
      return AppLocalStorage.getData(key: Const.KEY_CURRENT_LONGITUD)
          .toString();
    } else {
      return '';
    }
  }

  static int getPlaceItemSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550
        ? /* PHONE */ 2
        : /* TABLET */ 3;
  }

  static void goToLogin() {
    AuthRepository.removeToken();
    UserRepository.removeUser();
    popAllAndPushNamesWOContext(AppRoutes.login);
  }

  static String iconBack(){
    return LanguageRepository.getLang == 'ar' ? '${Const.icons}icon_back_ar.svg' : '${Const.icons}icon_back_en.svg';
  }

  static void statusBarColor({required bool isHome}){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
        statusBarColor: AppHelper.getAppTheme(),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
  }

  static Color get randColor {
    Random random = Random();
    int darkColor = random.nextInt(256);
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return Color.fromARGB(255, max(red - darkColor, 0), max(green - darkColor, 0), max(blue - darkColor, 0));
  }

}
