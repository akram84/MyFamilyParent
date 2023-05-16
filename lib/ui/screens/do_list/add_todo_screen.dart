
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/children/child.dart';
import 'package:my_family/getx/controller/home/do_list_controller.dart';
import 'package:my_family/ui/helper/app_size_boxes.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import '../../../data/repository/member/children_repo.dart';
import '../../widgets/components.dart';
import '../../widgets/text_form_field.dart';

class AddTodoScreen extends GetView<ToDoListController> {
  AddTodoScreen({super.key});

  final _controller = Get.put(ToDoListController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToDoListController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.colorBackground,
        appBar: AppBar(
          backgroundColor: AppHelper.getAppTheme(),
          elevation: 0,
          title: AppText.medium(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              text: 'add_task',
              color: Colors.white),
          toolbarHeight: 60.h,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.maybePop(context)),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:const EdgeInsetsDirectional.only(start: 16,top: 30),
                child: AppText.medium(text: 'choose-child_todo',
                    fontSize:14 ,
                    fontWeight:FontWeight.w400),
              ),
              GetBuilder<ToDoListController>(
                  builder: (controller) => Container(
                    margin:const EdgeInsetsDirectional.only(start: 16,end: 16,top: 16),
                    width: double.infinity.w,
                    height: 50.h,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: AppText.medium(
                          text: controller.selectedChild?.name??'name_child'.tr,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppHelper.getAppTheme(),
                        ),
                        items: ChildrenRepo.children
                            .map((item) =>
                            DropdownMenuItem<Child>(
                              value: item,
                              child: Text(
                                item.name,
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
                          controller.selectedChild = value;
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
                margin: const EdgeInsetsDirectional.only(start: 16,top: 16),
                child: AppText.medium(text: 'how_many_tasks',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              GetBuilder<ToDoListController>(
                  builder: (controller) => Container(
                    margin: const EdgeInsetsDirectional.only(top: 13,start: 16),
                    width: 180.w,
                    height: 50.h,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Obx(() => AppText.medium(
                          text: controller
                              .tasksCount.value.toString(),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppHelper.getAppTheme(),
                        )),
                        items: controller.listTasksCount
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
                          controller.tasksCount.value =
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
                margin: const EdgeInsetsDirectional.only(start: 16, top: 16),
                child: AppText.medium(text: 'add_task',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              ListView.builder(
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
                            controller: controller.tasksControllers[index],
                            hint: 'Task ${index + 1}',
                          ),
                        ),
                      ],
                    )
                  );
                },
                itemCount: controller.tasksCount.value,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 14.w, end: 14.w, top: 35.h, bottom: 20.h),
                child: AppWidgets.CustomButton(text: 'send', click: () => _controller.addTask(),
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
