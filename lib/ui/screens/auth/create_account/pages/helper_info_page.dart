import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/getx/controller/auth/create_account_controller.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/widgets/components.dart';

import '../../../../widgets/helper_permissions.dart';

class HelperInfoPage extends StatelessWidget {
  const HelperInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountController>(
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.colorBackground,
              appBar: AppBar(
                backgroundColor: AppColors.colorBackground,
                elevation: 0,
                title: AppText.larg(fontSize: 20, text: 'helpers'),
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
                      AppText.medium(text: 'how_many_helpers'),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GetBuilder<CreateAccountController>(
                                builder: (controller) => SizedBox(
                                      width: 180.w,
                                      height: 50.h,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          hint: Obx(() => AppText.medium(
                                                text: controller
                                                    .helperSelected.value,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppHelper.getAppTheme(),
                                              )),
                                          items: controller.listHelpersCount
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppHelper
                                                            .getAppTheme(),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            controller.helperSelected.value =
                                                value.toString();
                                            controller.update();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 32,
                                            color: Color(0xff000000),
                                          ),
                                          iconSize: 14.sp,
                                          iconEnabledColor: Colors.white,
                                          iconDisabledColor: Colors.white,
                                          buttonHeight: 50.h,
                                          buttonWidth: 40.w,
                                          buttonPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(26),
                                              border: Border.all(
                                                color:
                                                    AppColors.colorInputBorder,
                                                width: 0.5,
                                              ),
                                              color: Colors.white),
                                          itemHeight: 50,
                                          dropdownMaxHeight: 180,
                                          dropdownWidth: 180,
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                          ),
                                          dropdownElevation: 8,
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(10, 0),
                                        ),
                                      ),
                                    )),
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: int.parse(controller.helperSelected.value),
                          itemBuilder: (context, index) =>
                              buildHelpersItem(index)),
                      Container(
                        margin: const EdgeInsetsDirectional.only(
                            top: 40, bottom: 56),
                        alignment: AlignmentDirectional.center,
                        child: AppWidgets.CustomButton(
                            width: 300.w,
                            height: 48.h,
                            radius: 14.r,
                            background: AppHelper.getAppTheme(),
                            borderColor: AppHelper.getAppTheme(),
                            fontWeight: FontWeight.w700,
                            isUpperCase: false,
                            text: 'next'.tr,
                            click: () => controller.verifyHelpersInfo()),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget buildHelpersItem(int superIndex) {
    CreateAccountController controller = Get.find();
    return Container(
      margin: EdgeInsetsDirectional.only(top: 30.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
            child: AppText.medium(
                text: 'email_address',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18),
          ),
          SizedBox(height: 8.h),
          GetBuilder<CreateAccountController>(
              builder: (controller) => TextFormField(
                    controller: controller.getEntertainmentController(superIndex),
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.emailAddress,
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
                        hintText: 'enter_your_email'.tr,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontWeight: FontWeight.w400),
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                        helperMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.colorInputBorder, width: 1.w),
                          borderRadius: BorderRadius.circular(26).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppHelper.getAppTheme(), width: 1.w),
                          borderRadius: BorderRadius.circular(26).r,
                        ),
                        constraints: BoxConstraints(
                          maxHeight: 50.h,
                          minWidth: 48.w,
                        )),
                    validator: (email) => AppHelper.validateEmail(email: email),
                  )),
          Container(
            margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r, top: 16),
            child: AppText.medium(
                text: 'permissions',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18),
          ),
          SizedBox(height: 8.h),
          HelperPermissions(onSelect: (selected) => controller.setSelectedIndexes(superIndex, selected),),
        ],
      ),
    );
  }
}
