import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_family/ui/helper/index.dart';

import '../helper/app_helper.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: 40.w,
        height: 40.h,
        child: LoadingAnimationWidget.fourRotatingDots(color: AppHelper.getAppTheme(), size: 25.h),
      ),
    );
  }
}
