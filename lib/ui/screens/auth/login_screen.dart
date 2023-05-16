import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/getx/controller/auth/login_controller.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_routes.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/widgets/loading.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/widgets/components.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  final _controller = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: AppBar(
      backgroundColor: AppColors.colorBackground,
      elevation: 0,
      title: AppText.medium(
          text: ''),
      toolbarHeight: 80.h,
      centerTitle: true,
    ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  '${Const.images}login.png',
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 60.r, start: 16.r, end: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                        child: AppText.medium(text:'family_name',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        textInputAction: TextInputAction.go,
                        controller: controller.familyNameController,
                        keyboardType: TextInputType.text,
                        cursorColor: AppHelper.getAppTheme(),
                        cursorWidth: 1.3.w,
                        cursorRadius: Radius.circular(10.r),
                        enabled: true,
                        textAlignVertical: AppHelper.getTextAlignVertical(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'enter_your_family_name'.tr,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400
                            ),
                            fillColor: const Color(0xffFAFAFA),
                            filled: true,
                            helperMaxLines: 2,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 1.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 50.h,
                              minWidth: 48.w,
                            )),
                        validator: (familyName) => AppHelper.validateFamilyName(familyName: familyName!),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 30.r, start: 16.r, end: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                        child: AppText.medium(text:'email_address',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 12.h),
                      TextFormField(
                        textInputAction: TextInputAction.go,
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: AppHelper.getAppTheme(),
                        cursorWidth: 1.3.w,
                        cursorRadius: Radius.circular(10.r),
                        enabled: true,
                        textAlignVertical: AppHelper.getTextAlignVertical(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'enter_your_email'.tr,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400
                            ),
                            fillColor: const Color(0xffFAFAFA),
                            filled: true,
                            helperMaxLines: 2,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 1.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 50.h,
                              minWidth: 48.w,
                            )),
                        validator: (familyName) => AppHelper.validateFamilyName(familyName: familyName!),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 30.r, start: 16.r, end: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                        child: AppText.medium(text:'family_password',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp ),
                      ),
                      SizedBox(height: 12.h),
                      GetBuilder<LoginController>(builder: (controller) => TextFormField(
                        textInputAction: TextInputAction.go,
                        controller: controller.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.isVisiblePass,
                        cursorColor: AppHelper.getAppTheme(),
                        cursorWidth: 1.3.w,
                        cursorRadius: Radius.circular(10.r),
                        obscuringCharacter: '•',
                        enabled: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Colors.black),
                        decoration: InputDecoration(
                            hintText: '••••••••'.tr,
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400
                            ),
                            fillColor: const Color(0xffFAFAFA),
                            filled: true,
                            helperMaxLines: 2,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 1.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 50.h,
                              minWidth: 48.w,
                            ),
                            suffixIcon: InkWell(
                              child: Icon(controller.visiblePassIcon, color: Colors.black),
                              onTap: () => controller.visiblePassword(),
                            )),
                        validator: (username) => AppHelper.validatePassword(password: username!),
                      )),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsetsDirectional.only(top: 44.r, start: 20.r, end: 20.r),
                child: AppWidgets.CustomButton(
                    text: 'login'.tr,
                    isUpperCase: false,
                    height: 48.h,
                    radius: 14,
                    background: AppHelper.getAppTheme(),
                    borderColor: AppHelper.getAppTheme(),
                    click: () {
                      controller.login(familyName: controller.familyNameController.text, email: controller.emailController.text, password: controller.passwordController.text);
                    }),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.larg(text: 'dont_have_account', fontSize: 12.sp),
                    SizedBox(width: 8.w),
                    InkWell(
                        child: AppText.larg(text: 'create_account', color: AppHelper.getAppTheme()),
                        onTap: () => pushNameWOContext(AppRoutes.createAccount)),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 50),
                    child: Obx(() => controller.isLoading.isTrue ? const AppLoading() : Container())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}