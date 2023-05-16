import 'package:flutter/material.dart';

import '../helper/size_extension.dart';
import '../resources/app_color.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {super.key, this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        iconSize: height?.h,
        padding: const EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: width?.w,
          height: height?.h,
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      shape: _setShape(),
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setShape(){
    switch(shape){
      case IconButtonShape.CircleBorder20: return BoxShape.circle;
      case IconButtonShape.RoundedBorder12: return BoxShape.rectangle;
      case IconButtonShape.CircleBorder15:
        break;
      default:
        return BoxShape.circle;
    }
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll14:
        return EdgeInsets.all(14.r);
      case IconButtonPadding.PaddingAll7:
        return EdgeInsets.all(7.r);
      default:
        return EdgeInsets.all(10.r);
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.OutlineGray70019:
        return AppColors.blue200;
      case IconButtonVariant.FillWhiteA700:
        return AppColors.whiteA700;
      case IconButtonVariant.OutlineGray100:
      case IconButtonVariant.OutlineBluegray10087:
      case IconButtonVariant.OutlineGray1007f:
      case IconButtonVariant.GradientTealA40026Lightgreen50026:
        return null;
      default:
        return AppColors.whiteA700;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineGray100:
        return Border.all(color: AppColors.gray100, width: 1.w);
      case IconButtonVariant.OutlineBluegray10087:
        return Border.all(color: AppColors.blueGray10087, width: 1.w);
      case IconButtonVariant.OutlineGray1007f:
        return Border.all(color: AppColors.gray1007f, width: 1.w);
      case IconButtonVariant.OutlineBlack9003f:
      case IconButtonVariant.OutlineGray70019:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.GradientTealA40026Lightgreen50026:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      // case IconButtonShape.CircleBorder20:
        // return BorderRadius.circular(20.r);
      case IconButtonShape.CircleBorder15:
        return BorderRadius.circular(15.r);
      // default:
      //   return BorderRadius.circular(10.r);
      case IconButtonShape.RoundedBorder12:
        return BorderRadius.circular(12.r);
      case IconButtonShape.CircleBorder20:
        // TODO: Handle this case.
        break;
      case null:
    }
  }

  _setGradient() {
    switch (variant) {
      case IconButtonVariant.OutlineGray1007f:
        return LinearGradient(
          begin: const Alignment(0.12, 0),
          end: const Alignment(0.88, 1),
          colors: [
            AppColors.amber40026,
            AppColors.pinkA20026,
          ],
        );
      case IconButtonVariant.GradientTealA40026Lightgreen50026:
        return LinearGradient(
          begin: const Alignment(0.85, 0.54),
          end: const Alignment(0.14, 0.54),
          colors: [
            AppColors.tealA40026,
            AppColors.lightGreen50026,
          ],
        );
      case IconButtonVariant.OutlineBlack9003f:
      case IconButtonVariant.OutlineGray100:
      case IconButtonVariant.OutlineBluegray10087:
      case IconButtonVariant.OutlineGray70019:
      case IconButtonVariant.FillWhiteA700:
        return null;
      default:
        return null;
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineGray70019:
        return [
          BoxShadow(
            color: AppColors.gray70019,
            spreadRadius: 2.r,
            blurRadius: 2.r,
            offset: const Offset(
              0,
              5,
            ),
          )
        ];
      case IconButtonVariant.OutlineGray100:
      case IconButtonVariant.OutlineBluegray10087:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.OutlineGray1007f:
      case IconButtonVariant.GradientTealA40026Lightgreen50026:
        return null;
      default:
        return [
          BoxShadow(
            color: AppColors.black9003f,
            spreadRadius: 1.r,
            blurRadius: 2.r,
            offset: const Offset(
              0,
              4,
            ),
          )
        ];
    }
  }
}

enum IconButtonShape {
  RoundedBorder12,
  CircleBorder20,
  CircleBorder15,
}

enum IconButtonPadding {
  PaddingAll10,
  PaddingAll14,
  PaddingAll7,
}

enum IconButtonVariant {
  OutlineBlack9003f,
  OutlineGray100,
  OutlineBluegray10087,
  OutlineGray70019,
  FillWhiteA700,
  OutlineGray1007f,
  GradientTealA40026Lightgreen50026,
}
