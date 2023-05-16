import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/getx/controller/auth/create_account_controller.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/widgets/components.dart';

class FamilyInfoPage extends StatelessWidget {
  const FamilyInfoPage({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountController>(builder: (controller) => Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppColors.colorBackground,
        elevation: 0,
        title: AppText.medium(
            text: ''),
        toolbarHeight: 80.h,
        centerTitle: true,
        leading: Container(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.medium(text: 'create_an_account', fontSize: 24),
              AppText.medium(text: 'connect_with_family_today', color: AppColors.colorSubText1),
              Container(
                margin: EdgeInsetsDirectional.only(top: 60.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                      child: AppText.medium(text:'family_name',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: controller.familyNameController,
                      keyboardType: TextInputType.text,
                      cursorColor: AppHelper.getAppTheme(),
                      cursorWidth: 1.3.w,
                      cursorRadius: const Radius.circular(26).r,
                      enabled: true,
                      textAlignVertical: AppHelper.getTextAlignVertical(),
                      textAlign: TextAlign.start,
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
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          helperMaxLines: 2,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.colorInputBorder, width: 1.w),
                            borderRadius: BorderRadius.circular(26).r,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                            borderRadius: BorderRadius.circular(26).r,
                          ),
                          constraints: BoxConstraints(
                            maxHeight: 50.h,
                            minWidth: 48.w,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 30.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                      child: AppText.medium(text:'family_password',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8.h),
                    GetBuilder<CreateAccountController>(builder: (controller) => TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: controller.familyPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isVisibleFamilyPass,
                      cursorColor: AppHelper.getAppTheme(),
                      cursorWidth: 1.3.w,
                      cursorRadius: const Radius.circular(26).r,
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
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          helperMaxLines: 2,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.colorInputBorder, width: 1.w),
                            borderRadius: BorderRadius.circular(26).r,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                            borderRadius: BorderRadius.circular(26).r,
                          ),
                          constraints: BoxConstraints(
                            maxHeight: 50.h,
                            minWidth: 48.w,
                          ),
                          suffixIcon: InkWell(
                            child: Icon(controller.visibleFamilyPassIcon, color: Colors.black),
                            onTap: () => controller.visibleFamilyPassword(),
                          )),
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 30.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                      child: AppText.medium(text:'confirm_password',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    SizedBox(height: 8.h),
                    GetBuilder<CreateAccountController>(builder: (controller) => TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: controller.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isVisibleConfirmPass,
                      cursorColor: AppHelper.getAppTheme(),
                      cursorWidth: 1.3.w,
                      cursorRadius: const Radius.circular(26).r,
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
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          helperMaxLines: 2,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.colorInputBorder, width: 1.w),
                            borderRadius: BorderRadius.circular(26).r,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppHelper.getAppTheme(), width: 1.w),
                            borderRadius: BorderRadius.circular(26).r,
                          ),
                          constraints: BoxConstraints(
                            maxHeight: 50.h,
                            minWidth: 48.w,
                          ),
                          suffixIcon: InkWell(
                            child: Icon(controller.visibleConfirmPassIcon, color: Colors.black),
                            onTap: () => controller.visibleConfirmPassword(),
                          )),
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(top: 40, bottom: 56),
                alignment: AlignmentDirectional.center,
                child: AppWidgets.CustomButton(
                    width: 300.w,
                    height: 48.h,
                    radius: 14.r,
                    background: AppHelper.getAppTheme(),
                    borderColor: AppHelper.getAppTheme(),
                    fontWeight: FontWeight.w700,
                    isUpperCase: false,
                    text: 'next'.tr, click: () => controller.verifyFamilyInfo()),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
