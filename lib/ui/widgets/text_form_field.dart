import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../helper/app_helper.dart';
import '../resources/index.dart';
import 'index.dart';

class AppFormField extends StatelessWidget {

  AppFormField({Key? key,
    this.label,
    this.hint,
    this.preIcon,
    this.sufIcon,
    this.autofocus = false,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.size,
    this.height,
    this.onSufTap,
    this.onChanged,
    this.validate,
    this.fromKey,
    required this.controller,
    this.borderColor,
    this.formatters,
    this.title,
    this.spaceAfterTitle,
    this.fillColor,
    this.suffixBox,
    this.contentPadding,
    this.maxLines, this.hintStyle, this.radius,
  }) : super(key: key);

  String? label;
  String? hint;
  Widget? preIcon;
  Widget? sufIcon;
  bool autofocus = false;
  bool obscureText = false;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  Color? borderColor;

  double? size;
  double? height = 1.5;
  void Function()? onSufTap;
  Function(String val)? onChanged;
  String? Function(String? val)? validate;
  dynamic fromKey;
  TextEditingController controller;
  final List<TextInputFormatter>? formatters;

  final String? title;
  final Widget? spaceAfterTitle;
  final Color? fillColor;

  final Widget? suffixBox;

  final EdgeInsets? contentPadding;

  final int? maxLines;

  final TextStyle? hintStyle;

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title != null)...[
          AppText(
            translation: title,
            style: AppTextStyles.txtRobotoRomanRegular14Bluegray300,
          ),
          spaceAfterTitle??const SizedBox.shrink(),
        ],
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Form(
                key: fromKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  autofocus: autofocus,
                  obscureText: obscureText,
                  obscuringCharacter: '●',
                  controller: controller,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,

                  cursorColor: AppHelper.getAppTheme(),

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: formatters,
                  style: TextStyle(
                    fontSize: size?.sp ?? 15.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: height?.h,
                  ),
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    filled: borderColor == null,
                    fillColor: fillColor ?? AppColors.gray300,
                    hintText: (hint??'').tr,
                    prefixIcon: preIcon,
                    suffixIcon: sufIcon != null ? IconButton(icon: sufIcon!, onPressed: onSufTap) : null,

                    hintStyle: hintStyle ?? TextStyle(
                      color: AppColors.blueGray300,
                      fontSize: size?.sp ?? 13.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: contentPadding ?? EdgeInsets.symmetric(
                        vertical: 15.0.h, horizontal: 10.0.w),
                    enabledBorder: borderColor != null ? OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor!),
                      borderRadius: BorderRadius.circular(radius ?? 26.r),
                    ) : null,
                    focusedBorder: borderColor != null ? OutlineInputBorder(
                      borderSide: BorderSide(color: AppHelper.getAppTheme()),
                      borderRadius: BorderRadius.circular(radius ?? 26.r),
                    ) : null,
                    errorBorder: borderColor != null ? OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.colorRed),
                      borderRadius: BorderRadius.circular(radius ?? 26.r),
                    ) : null,
                    focusedErrorBorder: borderColor != null ? OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.colorRed),
                      borderRadius: BorderRadius.circular(radius ?? 26.r),
                    ) : null,
                  ),
                  onChanged: onChanged,
                  validator: validate,
                ),
              ),
            ),
            suffixBox??const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}