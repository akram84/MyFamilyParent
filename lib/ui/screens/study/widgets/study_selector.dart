
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/children/child.dart';
import 'package:my_family/data/repository/member/children_repo.dart';
import 'package:my_family/getx/controller/home/study_controller.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';



class StudySelector extends StatelessWidget {
  const StudySelector({Key? key, required this.child}) : super(key: key);

  final bool child;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudyController>(
        builder: (controller) => Container(
          margin:const EdgeInsetsDirectional.only(start: 16,end: 16,top: 16),
          width: double.infinity.w,
          height: 50.h,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: AppText.medium(
                text: child ? controller.selectedChild?.name??'name_child'.tr : controller.subjectsCount.value.toString(),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppHelper.getAppTheme(),
              ),
              items: (child ? ChildrenRepo.children : controller.counts)
                  .map((item) =>
                  DropdownMenuItem(
                    value: item,
                    child: Text(
                      child ? (item as Child).name : '$item',
                      style: TextStyle(
                        fontSize: 16.sp,
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
                if(child) {
                  controller.selectedChild = value as Child;
                } else {
                  controller.subjectsCount.value = value as int;
                }
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
        ));
  }
}
