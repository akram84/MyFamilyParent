import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/ui/resources/app_color.dart';

class AppWidgets {
  static Widget CustomButton({
    required String text,
    required Function() click,
    double width = double.infinity,
    double height = 48.0,
    Color background = AppColors.colorAppMain,
    bool isUpperCase = true,
    Color textColor = Colors.white,
    double fontSize = 16.0,
    String fontfamily = Const.appFont,
    FontWeight fontWeight = FontWeight.w700,
    double radius = 14.0,
    double marginLeft = 0.0,
    Color borderColor = AppColors.colorAppMain,
    double borderWidth = 1.5,
  }) =>
      Container(
        margin: EdgeInsets.only(left: marginLeft),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
            border: Border.all(color: borderColor, width: borderWidth)),
        child: MaterialButton(
          onPressed: click,
          child: Text(
            isUpperCase ? text.toUpperCase().tr : text.tr,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize.sp,
                fontFamily: fontfamily,
                fontWeight: fontWeight),
          ),
        ),
      );
}