import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/data/model/children/child.dart';
import 'package:my_family/data/model/study/subjects.dart';
import 'package:my_family/ui/helper/app_size_boxes.dart';
import 'package:my_family/ui/resources/app_color.dart';

import '../../helper/app_helper.dart';
import '../../resources/app_text.dart';
import '../../widgets/app_image.dart';
import '../../widgets/app_search.dart';
import 'widgets/assignment.dart';
import 'widgets/assignments_days.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key, required this.subject, required this.child});

  final Child child;
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'assignments', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),
      ),
      backgroundColor: AppColors.whiteA700,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 22.heightBox,
            AppSearch(
                focusNode: FocusNode(),
                controller: TextEditingController(),
                hintText: "Search assignment",
                margin: EdgeInsets.only(left: 16.w, top: 22.h, right: 16.w),
                variant: SearchViewVariant.outlineGray400,
                fontStyle: SearchViewFontStyle.robotoRomanRegular14,
                prefix: Container(
                    margin: EdgeInsets.only(left: 12.w, top: 12.h, right: 7.w, bottom: 12.h),
                    child: const AppImage(imagePath: '${Const.icons}search.svg')),
                prefixConstraints: BoxConstraints(maxHeight: 40.h)),
            24.heightBox,
            Days(),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 20.h, right: 16.w),
              child: subject.assignments.isEmpty ? Center(child: AppText.medium(text: 'There is no Assignments to be done now')) : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => 16.heightBox,
                itemCount: subject.assignments.length,
                itemBuilder: (context, index) => Assignment(subject: subject, index: index, child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
