import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/ui/resources/app_color.dart';

class AppText {
  static Widget larg(
      {required String text,
      Color? color = AppColors.lightBlack,
      double fontSize = 18,
      FontWeight fontWeight = FontWeight.w700,
      TextAlign? textAlign}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: Const.appFont,
          fontSize: Platform.isAndroid ? fontSize.sp : 15.sp,
          fontWeight: fontWeight,
          color: color),
    );
  }

  static Widget medium(
      {required String text,
      Color? color = Colors.black,
      double fontSize = 16,
      double? height,
      FontWeight fontWeight = FontWeight.w600,
      TextAlign? textAlign,
      int? maxline}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      textWidthBasis: TextWidthBasis.longestLine,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: Const.appFont,
          fontSize: Platform.isAndroid ? fontSize.sp : 13.sp,
          color: color,
          height: height,
          fontWeight: fontWeight),
    );
  }
}
