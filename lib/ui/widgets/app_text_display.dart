import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/helper/index.dart';

import '../resources/index.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key, this.color,
      this.size,
      this.text,
      this.fontFamily,
      this.decoration,
      this.translation,
      this.overflow = TextOverflow.ellipsis,
      this.style,
      this.leading,
      this.trailing,
      this.trailingAlignment,
      this.suffixTranslation,
      this.prefixTranslation,
      this.softWrap = false,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
      this.fontWeight,
      this.isUpper = false,
      this.addText,
      this.onTap,
      this.backgroundColor,
      this.backgroundColorPadding,
        this.padding = EdgeInsets.zero, this.preIcon, this.mainAxisAlignment
      });
  final Color? color;
  final double? size;
  final String? text;
  final String? suffixTranslation;
  final String? prefixTranslation;
  final String? translation;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;
  final bool? isUpper;
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Widget? leading;
  final Widget? trailing;
  final MainAxisAlignment? trailingAlignment;
  final TextStyle? style;
  final GestureTapCallback? onTap;
  final String? addText;
  final Color? backgroundColor;
  final EdgeInsets? backgroundColorPadding;
  final EdgeInsets padding;
  final Widget? preIcon;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = style ?? AppTextStyles.txtRobotoMedium18;
    if (color != null) {
      textStyle = textStyle.copyWith(color: color, fontSize: size, fontWeight: fontWeight);
    }else{
      textStyle = textStyle.copyWith(fontSize: size, fontWeight: fontWeight);

    }
    if (leading != null) {
      return InkWell(
        onTap: onTap ?? () {},
        child: Row(
          children: <Widget>[
            leading!,
            16.widthBox,
            Expanded(child: buildText(context, textStyle)),
          ],
        ),
      );
    }

    if (trailing != null) {
      return InkWell(
        onTap: onTap ?? () {},
        child: Row(
          mainAxisAlignment: trailingAlignment ?? MainAxisAlignment.start,
          children: <Widget>[buildText(context, textStyle), trailing!],
        ),
      );
    }
    return buildText(context, textStyle);
  }

  Widget buildText(BuildContext context, TextStyle textStyle) {
    if(color == AppColors.lightWhite)textStyle.copyWith(color: null);
    String displayText = translation != null && translation!.isNotEmpty ? translation!.tr : text ?? '';
    if (prefixTranslation != null) {
      displayText = '${prefixTranslation!.tr} $displayText';
    }
    if (suffixTranslation != null) {
      displayText = '$displayText ${suffixTranslation!.tr} ';
    }
    if (addText != null && addText!.isNotEmpty) displayText += '$addText';
    if(preIcon != null){
      return Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          preIcon!,
          5.widthBox,
          Text(
            displayText,
            textAlign: textAlign,
            overflow: overflow,
            maxLines: maxLines,
            softWrap: softWrap,
            style: textStyle,
          ),
        ],
      );
    }
    if(backgroundColor != null) {
      return Container(
        color: backgroundColor,
        padding: backgroundColorPadding,
        child: Center(
          child: Text(
            displayText,
            textAlign: textAlign,
            overflow: overflow,
            maxLines: maxLines,
            softWrap: softWrap,
            style: textStyle,
          ),
        ),
      );
    }
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Text(
          displayText,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
          style: textStyle,
        ),
      ),
    );
  }
}
