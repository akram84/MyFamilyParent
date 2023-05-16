import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../../resources/index.dart';

class About extends StatelessWidget {
  const About({Key? key, required this.title, required this.body}) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.heightBox,
        Text(title.tr, style: AppTextStyles.txtRobotoRomanMedium18Black900),
        5.heightBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            body.tr,
            maxLines: null,
            style: AppTextStyles.txtRobotoRomanRegular16Black9001,
          ),
        ),
      ],
    );
  }
}
