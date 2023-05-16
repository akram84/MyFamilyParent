import 'package:flutter/material.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../resources/index.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/index.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'help'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            44.heightBox,
            AppText(translation: "problem_title", style: AppTextStyles.txtRobotoRomanRegular14Black900),
            10.heightBox,
            AppFormField(
              hint: 'enter_problem_title',
              hintStyle: AppTextStyles.txtRobotoRomanRegular14Bluegray300,
              controller: TextEditingController(),
              borderColor: AppColors.colorInputBorder,
              maxLines: 1,
            ),
            18.heightBox,
            AppText(translation: "problem_explain", style: AppTextStyles.txtRobotoRomanRegular14Black9001),
            10.heightBox,
            AppFormField(
              hint: 'enter_problem_explain',
              hintStyle: AppTextStyles.txtRobotoRomanRegular16Bluegray300,
              controller: TextEditingController(),
              borderColor: AppColors.colorInputBorder,
              maxLines: 7,
            ),
            // 16.heightBox,
            // Container(
            //   decoration: AppBoxDecoration.outlineGray9000f.copyWith(borderRadius: AppCorners.roundedBorder8),
            //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       const AppImage(imagePath: AppImages.camera, width: 25, height: 22,),
            //       6.widthBox,
            //       AppText(translation: 'add_problem_picture', style: AppTextStyles.txtRobotoRomanMedium12),
            //     ],
            //   ),
            // ),
            110.heightBox,
            AppButton(
              translation: 'save',
              onTap: () => pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
