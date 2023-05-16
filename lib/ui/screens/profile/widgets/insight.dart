import 'package:flutter/material.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../../data/model/children/child_insights.dart';
import '../../../resources/app_box_decoration.dart';
import '../../../resources/app_text_styles.dart';
import '../../../widgets/app_image.dart';
import '../../../widgets/app_text_display.dart';

class Insight extends StatelessWidget {
  const Insight({Key? key, required this.insight}) : super(key: key);

  final Insights insight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: AppBoxDecoration.outlineGray1007f.copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
      child: Row(
        children: [
          AppImage(imagePath: insight.icon),
          12.widthBox,
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "${insight.percentage.round()}%",
                      style: AppTextStyles.txtRobotoRomanMedium16Black900b2,
                    ),
                    3.heightBox,
                    AppText(
                      text: insight.name,
                      style: AppTextStyles.txtRobotoRomanMedium16Black900b2,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
