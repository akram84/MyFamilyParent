import 'package:flutter/material.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/data/model/study/assignment.dart';
import 'package:my_family/ui/helper/app_size_boxes.dart';
import 'package:my_family/ui/helper/size_extension.dart';
import 'package:my_family/ui/widgets/app_image.dart';
import 'package:my_family/ui/widgets/app_text_display.dart';

import '../../../data/model/children/child.dart';
import '../../helper/app_helper.dart';
import '../../resources/index.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({Key? key, this.assignment, this.child}) : super(key: key);

  final Assignment? assignment;
  final Child? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: const AppText(
            fontWeight: FontWeight.w700,
            size: 18,
            text: 'assignments',
            color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),
      ),
      backgroundColor: AppColors.whiteA700,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
        decoration: AppBoxDecoration.fillWhiteA700
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: AppImage(image: child?.image, width: 80, height: 80,),
                ),
                13.widthBox,
                AppText(text: child?.name??'', style: AppTextStyles.txtRobotoRomanMedium18Black900)
              ],
            ),
            20.heightBox,
            AppText(
              text: assignment?.title??'',
              style: AppTextStyles.txtRobotoRomanMedium16,
            ),
            13.heightBox,
            AppText(
              text: assignment?.description??'',
              maxLines: null,
              style: AppTextStyles.txtRobotoRomanRegular12Black9007f,
            ),
            21.heightBox,
            AppImage(
              image: assignment?.image??'https://s3-alpha-sig.figma.com/img/b90f/3718/bfb5e021e357de467238ed12301cc88e?Expires=1679270400&Signature=U4hMWMY-obHH-ZF5U9thX990lT6lCgWTxkDSbZ-zj2KUoQGzRra-QHbaihBHz5FWGq90yysh7NhsA8Y89MJlVXtdaEoznTr0YlVgkVuKVsXRfayWBe23b3dCvc5H8NDSZyiSvXz3kYR9HZORa9hSmwAiehQb3AVVyRDeFv6mH04yruRrpmieb6tihQHPsJUKMMfbxctVLgBeZ-7-K8RtbogEirJSD82NmlL7YuUYLTDY-1ddfgFCRMjwtiNBpRPkBwt~ROKH5T8GaNZDb6tvlX~qHI6NtifLH8njDgSMRxaQWGL-pqDaFQ5kEEHhU6mG3EuuukoS29xYm4E9gKb2-Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
              radius: 15.r,
            ),
            9.heightBox,
            Row(
              children: [
                AppImage(
                  imagePath: '${Const.icons}check.svg',
                  height: 12.h,
                  width: 12.w,
                ),
                5.widthBox,
                Text("Submitted", style: AppTextStyles.txtRobotoRomanRegular10RedA10093),
                const Spacer(),
                Text("19 Seb", style: AppTextStyles.txtRobotoRomanRegular10Blue200)
              ],
            )
          ],
        ),
      ),
    );
  }
}
