import 'package:flutter/material.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/screens/study/assignment_screen.dart';

import '../../../../data/model/children/child.dart';
import '../../../../data/model/study/assignment.dart' as model;
import '../../../../data/model/study/subjects.dart';
import '../../../resources/app_box_decoration.dart';
import '../../../resources/app_text_styles.dart';
import '../../../widgets/app_image.dart';

class Assignment extends StatelessWidget {
  const Assignment({super.key, required this.child, required this.subject, required this.index, });

  final Child child;
  final Subject subject;
  final int index;

  @override
  Widget build(BuildContext context) {
    model.Assignment assignment = subject.assignments[index];
    return InkWell(
      onTap: () => pushPage(context, AssignmentScreen(assignment: assignment, child: child)),
      child: Container(
        padding: EdgeInsets.only(
          left: 12.w,
          top: 11.h,
          right: 12.w,
          bottom: 11.h,
        ),
        decoration: AppBoxDecoration.outlineBlack900.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder27,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  assignment.title??'',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.txtRobotoRomanMedium14,
                ),
                Text(
                  AppDateFormatter.getFullDate(date: assignment.dueDate, format: 'MMMMd'),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.txtRobotoRomanRegular10Blue200,
                ),
              ],
            ),
            12.heightBox,
            Text(
              subject.subject??'',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppTextStyles.txtRobotoRomanRegular14Black900b2,
            ),
            4.heightBox,
            Text(
              assignment.description??'',
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppTextStyles.txtRobotoRomanRegular12Black9007f,
            ),
            5.heightBox,
            assignment.done??false ? Row(
              children: [
                AppImage(
                  imagePath: '${Const.icons}check.svg',
                  height: 12,
                  width: 12,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "Submitted ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.txtRobotoRomanRegular10RedA10093,
                  ),
                ),
                const Spacer(),
                Text(
                  "Readmore",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.txtRobotoRomanRegular10RedA10093,
                ),
              ],
            ) : Text(
              "Not submitted",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppTextStyles.txtRobotoRomanRegular10RedA10093,
            ),
          ],
        ),
      ),
    );
  }
}
