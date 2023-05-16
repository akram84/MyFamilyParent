import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/data/model/language.dart';
import 'package:my_family/data/model/theme.dart';
import 'package:my_family/data/repository/language_repository.dart';
import 'package:my_family/data/repository/theme_repository.dart';
import 'package:my_family/data/repository/user_repository.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_routes.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/widgets/components.dart';

import '../../../ui/resources/app_text.dart';

class SettingsController extends GetxController{

  String languageSelected = '';

  List<AppTheme> listThemes = [
    AppTheme(name: Const.KEY_THEME_DEFAULT, hexColor: 0xFFA1C2F5, isSelected: true),
    AppTheme(name: Const.KEY_THEME_BLUE, hexColor: 0xFF42A0E4, isSelected: false),
    AppTheme(name: Const.KEY_THEME_GREEN, hexColor: 0xFF23A757, isSelected: false),
    AppTheme(name: Const.KEY_THEME_YALLOW, hexColor: 0xFFF9BC12, isSelected: false),
    AppTheme(name: Const.KEY_THEME_DARK, hexColor: 0xFF212121, isSelected: false),
    AppTheme(name: Const.KEY_THEME_RED, hexColor: 0xFFFb3236, isSelected: false),
    AppTheme(name: Const.KEY_THEME_DARK_BLUE, hexColor: 0xFF0E3255, isSelected: false),
    AppTheme(name: Const.KEY_THEME_BROWN, hexColor: 0xFFC05E2B, isSelected: false),
    AppTheme(name: Const.KEY_THEME_ORANGE, hexColor: 0xFFF58A07, isSelected: false),
  ];

  List<Language> listLanguages = [
    Language(language: 'arabic', languageCode: Const.KEY_LANGUAGE_AR, isSelected: true),
    Language(language: 'english', languageCode: Const.KEY_LANGUAGE_EN, isSelected: false),
  ];

  Future<void> saveTheme(AppTheme theme) async{
    listThemes.forEach((e) => e.isSelected = false);
    theme.isSelected = true;

    await ThemeRepository.saveTheme(theme.name);
    print(ThemeRepository.getTheme);
    AppHelper.statusBarColor(isHome: true);
    update();
  }

  void saveLanguage(String codeLang) {
    Locale locale = Locale(codeLang);
    LanguageRepository.saveLang(codeLang);
    AppHelper.getAppTheme();
    Get.updateLocale(locale);
  }

  void showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 320,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 50,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(height: 20),
                AppText.larg(
                    text: AppHelper.getCurrentUserToken() != null ? 'logout' : 'login', fontSize: Platform.isAndroid ? 20 : 16, fontWeight: FontWeight.w700),
                const SizedBox(height: 14),
                AppText.larg(
                    text: AppHelper.getCurrentUserToken() != null ? 'text_log_out' : 'please_login',
                    fontSize: Platform.isAndroid ? 16 : 13,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsetsDirectional.only(top: 30, end: 10),
                          width: double.infinity,
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: AppHelper.getAppTheme(),
                              borderColor: AppHelper.getAppTheme(),
                              text: AppHelper.getCurrentUserToken() != null ? 'logout'.tr : 'login'.tr,
                              isUpperCase: false,
                              click: () {
                                if(AppHelper.getCurrentUserToken() != null) {
                                  logout();
                                } else {
                                  AppHelper.goToLogin();
                                }
                              })),
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          margin:
                          const EdgeInsetsDirectional.only(top: 30, start: 10),
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: AppColors.lightWhite,
                              borderColor: AppHelper.getAppTheme(),
                              text: 'cancel'.tr,
                              textColor: AppHelper.getAppTheme(),
                              isUpperCase: false,
                              click: () => Navigator.pop(context))),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        });
  }

  void logout() async {

    await UserRepository.logout()
        .then((value) {
          if(value != null){
            popAllAndPushNamesWOContext(AppRoutes.login);
          }
    });

  }
}