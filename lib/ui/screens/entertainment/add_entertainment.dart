import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/helper/app_size_boxes.dart';

import '../../../getx/controller/home/entertainments_controller.dart';
import '../../helper/app_helper.dart';
import '../../widgets/components.dart';
import '../../resources/app_color.dart';
import '../../resources/app_text.dart';
import '../../widgets/text_form_field.dart';

class AddEntertainmentScreen extends GetView<EntertainmentsController> {
  const AddEntertainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'add_entertainment', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(AppHelper.iconBack(), height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
            onTap: () => Navigator.maybePop(context)),

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 60.r, start: 16.r, end: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                        child: AppText.medium(text:'add_title_entertainment',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp),
                      ),
                      SizedBox(height: 12.h),
                      GetBuilder<EntertainmentsController>(builder: (controller) => TextFormField(
                        controller: controller.titleEnterainmentsController,
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
                            hintText: 'add_title'.tr,
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
                        validator: (title) => (title?.isEmpty??true) ? 'Title Cannot be empty' : null,
                      )),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 16,top: 16),
                child: AppText.medium(text: 'how_many_suggestions',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              GetBuilder<EntertainmentsController>(
                  builder: (controller) => Container(
                    margin: const EdgeInsetsDirectional.only(top: 13,start: 16),
                    width: 180.w,
                    height: 50.h,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Obx(() => AppText.medium(
                          text: controller
                              .suggestionsCount.value.toString(),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppHelper.getAppTheme(),
                        )),
                        items: controller.listSuggestionsCount
                            .map((item) =>
                            DropdownMenuItem<int>(
                              value: item,
                              child: Text(
                                '$item',
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
                          controller.suggestionsCount.value =
                              value??1;
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
              Container(
                margin:const EdgeInsetsDirectional.only(start: 20,top: 25),
                child: AppText.medium(text: 'add_suggestions',
                fontWeight: FontWeight.w400,
                fontSize: 14),
              ),
              GetBuilder<EntertainmentsController>(
                builder: (context) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Container(
                        margin: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                        decoration: BoxDecoration(
                            color: AppColors.gray30001,
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24.w, height: 24.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.r),
                                  color: AppColors.whiteA700,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 0.5,
                                      blurStyle: BlurStyle.outer,
                                      color: Color(0xFFFFA800),
                                    )
                                  ]
                              ),
                            ),
                            12.widthBox,
                            Expanded(
                              child: AppFormField(
                                contentPadding: EdgeInsets.zero,
                                controller: controller.suggestionsControllers[index],
                                hint: 'Suggestion ${index + 1}',
                              ),
                            ),
                          ],
                        )
                    );
                  },
                  itemCount: controller.suggestionsCount.value,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 14.w, end: 14.w, top: 35.h, bottom: 20.h),
                child: AppWidgets.CustomButton(text: 'send', click: () => controller.addEntertainment(),
                  radius: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
