import 'package:flutter/material.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';

import '../resources/app_images.dart';
import 'app_image.dart';


class AppSearch extends StatelessWidget {
  AppSearch(
      {super.key, this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints});

  SearchViewShape? shape;

  SearchViewPadding? padding;

  SearchViewVariant? variant;

  SearchViewFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildSearchViewWidget(),
          )
        : _buildSearchViewWidget();
  }

  _buildSearchViewWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: _setFontStyle(),
        decoration: _buildDecoration(),
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "Search",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: const Padding(
        padding: EdgeInsets.all(8.0),
        child: AppImage(
          imagePath: AppImages.search,
        ),
      ),
      // prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case SearchViewFontStyle.robotoRomanRegular14:
        return TextStyle(
          color: AppColors.black9007f,
          fontSize: 14.sp,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: 1.21.h
        );
      default:
        return TextStyle(
          color: AppColors.black9007f,
          fontSize: 16.sp,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: 1.19.h
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          20.r
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case SearchViewVariant.outlineGray400:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: AppColors.gray400,
            width: 1,
          ),
        );
      case SearchViewVariant.none:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: AppColors.black9007f,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case SearchViewVariant.outlineGray400:
        return AppColors.whiteA700;
      default:
        return null;
    }
  }

  _setFilled() {
    switch (variant) {
      case SearchViewVariant.outlineBlack9007F:
        return false;
      case SearchViewVariant.none:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      default:
        return EdgeInsets.symmetric(horizontal: 18.w, vertical: 9.h);
    }
  }
}

enum SearchViewShape {
  circleBorder20,
}
enum SearchViewPadding {
  paddingT9,
}
enum SearchViewVariant {
  none,
  outlineBlack9007F,
  outlineGray400,
}
enum SearchViewFontStyle {
  robotoRomanRegular16,
  robotoRomanRegular14,
}
