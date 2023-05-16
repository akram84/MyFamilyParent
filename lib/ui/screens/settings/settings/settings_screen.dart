import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/data/repository/user_repository.dart';
import 'package:my_family/getx/controller/home/settings_controller.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_routes.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/screens/settings/about/about_screen.dart';
import 'package:my_family/ui/screens/settings/account/edit_account_screen.dart';
import 'package:my_family/ui/screens/settings/help_screen.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import '../../../../data/repository/language_repository.dart';
import '../notifications_screen.dart';
import 'widgets/theme_builder.dart';
class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final _controller = Get.put(SettingsController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (controller) => Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'settings', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(AppHelper.iconBack(), height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
        onTap: () => popAllAndPushNamesWOContext(AppRoutes.home)),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () => pushPage(context, const NotificationsScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsetsDirectional.all(16.r),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.r))
              ),
              child: Container(
                width: double.infinity,
                height: 80.h,
                margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 8),
                padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                color: AppColors.lightWhite,
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('${Const.images}default_avatar.png'),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.medium(text: UserRepository.getUser?.parentName??'', fontWeight: FontWeight.w500, textAlign: TextAlign.start),
                        AppText.medium(text: UserRepository.getUser?.parentEmail??'', fontWeight: FontWeight.w400, color: AppColors.colorSubText, textAlign: TextAlign.start),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 20.r),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          child: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              color: AppHelper.getAppTheme(),
                              '${Const.icons}icon_user.svg')),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    AppText.medium(
                        text: 'edit_account',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ],
                ),
                onTap: () => pushPage(context, const EditAccountScreen()),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            offset:
                            const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                        child: SvgPicture.asset(
                            fit: BoxFit.scaleDown,
                            color: AppHelper.getAppTheme(),
                            '${Const.icons}icon_theme.svg')),
                  ),
                  SizedBox(
                      width: 20.w),
                  ExpandableTheme(
                      data: const ExpandableThemeData(useInkWell: true),
                      child: Container(child: buildExpandedThemes(_controller))),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 12.r),
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: AppHelper.getAppTheme(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w),
              child: InkWell(
                onTap: (){
                  final currLang = controller.languageSelected == 'en' ? 'ar' : 'en';
                  controller.languageSelected = currLang;
                  controller.saveLanguage(currLang);
                  controller.update();
                },
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          child: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              color: AppHelper.getAppTheme(),
                              '${Const.icons}icon_language.svg')),
                    ),
                    20.widthBox,
                    AppText.medium(
                        text: 'language',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    const Spacer(),
                    AppText.medium(text: LanguageRepository.getLang == 'ar' ? 'arabic'.tr : 'english'.tr, color: AppHelper.getAppTheme()),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          child: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              color: AppHelper.getAppTheme(),
                              '${Const.icons}icon_about.svg')),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    AppText.medium(
                        text: 'about',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ],
                ),
                onTap: () => pushPage(context, const AboutScreen()),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          child: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              color: AppHelper.getAppTheme(),
                              '${Const.icons}icon_help.svg')),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    AppText.medium(
                        text: 'help',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ],
                ),
                onTap: () => pushPage(context, const HelpScreen()),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 22.w),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          child: SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              color: AppHelper.getAppTheme(),
                              '${Const.icons}icon_logout.svg')),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    AppText.medium(
                        text: 'logout',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ],
                ),
                onTap: () => _controller.showLogoutBottomSheet(context),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
