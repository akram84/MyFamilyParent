import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/getx/controller/home/study_controller.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../data/model/study/study.dart';
import '../../helper/app_helper.dart';
import '../../resources/app_color.dart';
import '../../resources/app_routes.dart';
import '../../resources/app_text.dart';
import '../../widgets/app_image.dart';
import '../../widgets/loading.dart';
import 'subjects_screen.dart';

class StudyScreen extends GetView<StudyController> {
  StudyScreen({super.key});

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
            text: 'study', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                pushName(context, AppRoutes.addStudy);
              })
        ],
      ),
      body:RefreshIndicator(
        onRefresh: () async => _controller.getStudies(),
        child: GetBuilder<StudyController>(
          builder: (controller) {
            if(controller.studies == null) return const AppLoading();
            if(controller.studies!.isEmpty) return Center(child: ListView(shrinkWrap: true, children: [0.4.sh.heightBox, Center(child: AppText.medium(text: 'There is no Studies to be done now')), 0.4.sh.heightBox]));
            return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(parent:  BouncingScrollPhysics()),
                itemCount: controller.studies!.length,
                itemBuilder: (context, index) => buildStudy(context, controller.studies![index], index));
          },
        ),
      ),
    );
  }
  Widget buildStudy(BuildContext context, Study study, int index) => GetBuilder<StudyController>(builder: (controller) {
    final selected = index == controller.selectedStudyIndex;
    return Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: selected ? AppHelper.getAppTheme() : Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: Container(
      margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: InkWell(
        child: Container(
          margin:const EdgeInsetsDirectional.only(top: 8,bottom: 8),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: AppImage(image: study.child?.image, width: 80, height: 80,),
              ),
              SizedBox(width: 12.w),
              AppText.medium(text: study.child?.name??'',  color: selected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)
            ],
          ),
        ),
        onTap: (){
          controller.changeSelectedStudy(index);
          pushPage(context, SubjectsScreen(study: study));
        },
      ),
    ),
  );
  });
}
