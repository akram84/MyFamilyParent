import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/study/study.dart';
import 'package:my_family/data/model/study/subjects.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';

import '../../../getx/controller/home/study_controller.dart';
import '../../helper/app_helper.dart';
import '../../resources/app_text.dart';
import '../../widgets/child_card.dart';
import 'assignments_screen.dart';

class SubjectsScreen extends StatelessWidget {
  SubjectsScreen({super.key, required this.study});

  final Study study;
  final _controller = Get.put(StudyController());

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
            text: 'subjects', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ChildCard(child: study.child!),
          Expanded(
            child: study.subjects?.isEmpty ?? true
                ? Center(child: AppText.medium(text: 'There is no Assignments in any Subject'))
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: study.subjects!.length,
                    itemBuilder: (context, index) => buildSubject(context, index),
                  ),
          ),
        ],
      ),
    );
  }
  Widget buildSubject(BuildContext context, index) => GetBuilder<StudyController>(builder: (controller) {
    final selected = index == controller.selectedSubjectIndex;
    Subject subject = study.subjects![index];
    return Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: selected ? AppHelper.getAppTheme() : AppColors.lightGray7,
    elevation: 8,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.r)
    ),
    child: Container(
      margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: InkWell(

        child: Container(
          width: double.infinity,
          height: 40.h,
          alignment: AlignmentDirectional.center,
          margin:const EdgeInsetsDirectional.only(top: 8,bottom: 8),
          child: AppText.medium(text: subject.subject??'', color: selected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
        onTap: (){
          controller.changeSelectedSubject(index);
          pushPage(context, AssignmentsScreen(subject: subject, child: study.child!));
        },
      ),
    ),
  );
  });
}
