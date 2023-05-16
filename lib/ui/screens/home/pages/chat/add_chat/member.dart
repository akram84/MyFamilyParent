import 'package:flutter/material.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_text_styles.dart';
import 'package:my_family/ui/widgets/app_text_display.dart';

import '../../../../../widgets/app_image.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget({Key? key, required this.name, required this.image}) : super(key: key);

  final String name;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundColor: AppColors.whiteA700,
          child: AppImage(image: image, boxFit: BoxFit.scaleDown,),
        ),
        10.widthBox,
        AppText(text: name, style: AppTextStyles.txtRobotoMedium18,),
      ],
    );
  }
}
