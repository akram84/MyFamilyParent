import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../../getx/controller/home/study_controller.dart';
import '../../../helper/app_helper.dart';
import '../../../resources/app_color.dart';
import '../../../resources/app_text.dart';

class SubjectFormField extends StatelessWidget {
  const SubjectFormField({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 0.r, start: 16.r, end: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:const EdgeInsetsDirectional.only(top: 16),
            child: AppText.medium(text: 'add_title_Subject',
                fontSize:14 ,
                fontWeight:FontWeight.w400),
          ),
          SizedBox(height: 10.h),
          GetBuilder<StudyController>(
              builder: (controller) => TextFormField(
                controller: controller.subjectsTitles[index],
                textInputAction: TextInputAction.go,
                keyboardType: TextInputType.name,
                cursorColor: AppHelper.getAppTheme(),
                cursorWidth: 1.3.w,
                cursorRadius: Radius.circular(26.r),
                enabled: true,
                textAlignVertical: AppHelper.getTextAlignVertical(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'add_title_Subject'.tr,
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
                      borderRadius: BorderRadius.circular(26.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppHelper.getAppTheme(), width: 1.w),
                      borderRadius: BorderRadius.circular(26.r),
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 50.h,
                      minWidth: 48.w,
                    )),
                // validator: (email) => AppHelper.validateEmail(email: email),
              )),
        ],
      ),
    );
  }
}
