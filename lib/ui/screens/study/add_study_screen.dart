import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/getx/controller/home/study_controller.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/widgets/components.dart';

import 'widgets/study_selector.dart';
import 'widgets/subject_form_field.dart';


class AddStudyScreen extends GetView<StudyController> {
  AddStudyScreen({super.key});

  final _controller = Get.put(StudyController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudyController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.colorBackground,
        appBar: AppBar(
          backgroundColor: AppHelper.getAppTheme(),
          elevation: 0,
          title: AppText.medium(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              text: 'add_study',
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
                child: AppText.medium(text: 'choose-child_assignment',
                fontSize:14 ,
                fontWeight:FontWeight.w400),
              ),
              const StudySelector(child: true),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 16,top: 16),
                child: AppText.medium(text: 'how_many_subjects',
                fontSize: 14,
                fontWeight: FontWeight.w400),
              ),
              const StudySelector(child: false),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => SubjectFormField(index: index),
                itemCount: controller.subjectsCount.value,
              ),
              Container(
                margin:const EdgeInsetsDirectional.only(start: 14,end: 14,top: 20,bottom: 20),
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
