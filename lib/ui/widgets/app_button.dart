import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/helper/index.dart';

import '../resources/index.dart';
import 'index.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key,
    this.height,
    this.translation,
    this.color,
    this.textColor = Colors.white,
    this.onTap,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.textDecoration,
    this.borderRadius,
    this.padding,
    this.decoration,
    this.borderColor,
    this.center = false,
    this.centerText = true,
    this.isLoading = false,
    this.enabled = true,
    this.style,
    this.width,
    this.preIcon,
    this.margin,
  });
  final bool center;
  final bool centerText;
  final String? translation;
  final Color textColor;
  final double fontSize;
  final double? width;
  final double? height;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? textDecoration;
  final BoxDecoration? decoration;

  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final Color? color;
  final Color? borderColor;
  final GestureTapCallback? onTap;
  final bool isLoading;
  final bool enabled;
  final BorderRadiusGeometry? borderRadius;
  final Widget? preIcon;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    Color color = this.color??AppHelper.getAppTheme();
    if (!enabled) color = AppColors.gray50;
    if (isLoading) return const AppLoading();
    return Padding(
      padding: margin??EdgeInsets.zero,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: Container(
            alignment: Alignment.center,
            width: width,
            height: height?? 48.h,
            padding: padding,
            decoration:
                decoration ?? BoxDecoration(color: color, borderRadius: borderRadius ?? AppCorners.txtRoundedBorder14, border: Border.all(color: borderColor ?? Colors.transparent)),
            child: Align(
              alignment: centerText ? Alignment.center : Alignment.centerLeft,
              child: Padding(
                padding: centerText ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 15.0.w),
                child: AppText(
                  translation: translation?.tr.toUpperCase(),
                  textAlign: center ? TextAlign.center : TextAlign.start,
                  color: style != null ? style!.color : AppColors.lightWhite,
                  style: style ?? AppTextStyles.txtInterSemiBold16.copyWith(color: AppColors.colorDark, fontWeight: FontWeight.w700),
                  preIcon: preIcon,
                ),
              ),
            )),
      ),
    );
  }
}