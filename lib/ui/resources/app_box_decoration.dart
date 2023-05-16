import 'package:flutter/material.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';

import '../../data/repository/language_repository.dart';

class AppCorners {
  static BorderRadius roundedBorder8 = BorderRadius.circular(8.00.r);
  static BorderRadius roundedBorder4 = BorderRadius.circular(4.00.r);
  static BorderRadius roundedBorder5 = BorderRadius.circular(5.00.r);
  static BorderRadius roundedBorder107 = BorderRadius.circular(107.50.r);
  static BorderRadius roundedBorder13 = BorderRadius.circular(13.00.r);
  static BorderRadius roundedBorder10 = BorderRadius.circular(10.50.r);
  static BorderRadius txtRoundedBorder5 = BorderRadius.circular(5.50.r);
  static BorderRadius roundedBorder20 = BorderRadius.circular(20.00.r);
  static BorderRadius txtRoundedBorder14 = BorderRadius.circular(14.00.r);
  static BorderRadius circleBorder16 = BorderRadius.circular(16.00.r);
  static BorderRadius txtCustomBorderTL30 = BorderRadius.only(
    topLeft: Radius.circular(30.00.r),
    topRight: Radius.circular(30.00.r),
  );
  static BorderRadius roundedBorder29 = BorderRadius.circular(29.50.r);

  static var roundedBorder12 = BorderRadius.circular(12.00.r);

  static var txtRoundedBorder18 = BorderRadius.circular(12.00.r);
}

class AppBoxDecoration {
  static BorderRadius get endBorder4 {
    Radius c4 = Radius.circular(5.r), c0 = Radius.zero;
    bool english = LanguageRepository.getLang == 'en';
    return BorderRadius.only(
      topRight: english ? c4 : c0, bottomRight: english ? c4 : c0,
      topLeft: !english ? c4 : c0, bottomLeft: !english ? c4 : c0,
    );
  }



  static BoxDecoration get outlineRedA1003f => const BoxDecoration();

  static BoxDecoration get fillGray10001 => BoxDecoration(
        color: AppColors.gray10001,
      );

  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: AppColors.whiteA700,
        border: Border.all(color: AppColors.black900, width: 1.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray9000f,
            spreadRadius: 2.r,
            blurRadius: 2.r,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineBluegray4007f => BoxDecoration(
        border: Border.all(color: AppColors.blueGray4007f, width: 1.r),
      );

  static BoxDecoration get txtGradientBlue200Gray30001 => BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: const Alignment(
            0.5,
            -0.5,
          ),
          end: const Alignment(
            -0.5,
            0.5,
          ),
          colors: [
            AppColors.blue200,
            AppColors.gray30001,
          ],
        ),
      );

  static BoxDecoration get fillGray10003 => BoxDecoration(
        color: AppColors.gray10003,
      );

  static BoxDecoration get outlineGrey => BoxDecoration(
    shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFd9d9d9), width: 2.r),
      );

  static BoxDecoration get outlineBlue200 => BoxDecoration(
    shape: BoxShape.circle,
        border: Border.all(color: AppColors.blue200, width: 1.r),
      );


  static BoxDecoration get fillDeeppurpleA20001 => BoxDecoration(
        color: AppColors.deepPurpleA20001,
      );

  static BoxDecoration get fillGray4006c => BoxDecoration(
        color: AppColors.gray4006c,
      );

  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: AppColors.whiteA700,
      );

  static BoxDecoration get fillBlue200 => const BoxDecoration(
    color: AppColors.lightBlue6,
    shape: BoxShape.circle,
  );

  static BoxDecoration get fillGray9000f => BoxDecoration(
        color: AppColors.gray9000f,
      );

  static BoxDecoration get fillBlack90072 => BoxDecoration(
        color: AppColors.black90072,
      );

  static BoxDecoration get txtFillBlue200b2 => BoxDecoration(
        color: AppColors.blue200B2,
      );

  static BoxDecoration get outlineGray400 => BoxDecoration(
        color: AppColors.whiteA700,
        border: Border.all(color: AppColors.gray400, width: 1.r),
      );

  static BoxDecoration get fillBlue2006c => BoxDecoration(
        color: AppColors.blue2006c,
      );

  static BoxDecoration get outlineGray1007f => BoxDecoration(
        color: AppColors.whiteA700,
        border: Border.all(color: AppColors.gray1007f, width: 1.r
            // strokeAlign: StrokeAlign.outside,
            ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black9003f,
            spreadRadius: 1.r,
            blurRadius: 3.r,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineGray9000f => BoxDecoration(
        color: AppColors.whiteA700,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray9000f,
            spreadRadius: 2.r,
            blurRadius: 2.r,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineBlack90029 => BoxDecoration(
        color: AppColors.whiteA700,
        boxShadow: [
          BoxShadow(
            color: AppColors.black90029,
            spreadRadius: 2.r,
            blurRadius: 2.r,
            offset: const Offset(
              0,
              3,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineBluegray50 => BoxDecoration(
        border: Border.all(color: AppColors.blueGray50, width: 1.r),
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderTL32 = BorderRadius.only(
    topLeft: Radius.circular(32.r),
    topRight: Radius.circular(32.r),
  );

  static BorderRadius circleBorder37 = BorderRadius.circular(37.r);

  static BorderRadius txtCustomBorderTL8 = BorderRadius.only(
    topLeft: Radius.circular(8.r),
    bottomLeft: Radius.circular(8.r),
    bottomRight: Radius.circular(8.r),
  );

  static BorderRadius roundedBorder27 = BorderRadius.circular(27.r);

  static BorderRadius circleBorder24 = BorderRadius.circular(24.r);

  static BorderRadius roundedBorder15 = BorderRadius.circular(15.r);

  static BorderRadius circleBorder51 = BorderRadius.circular(51.r);

  static BorderRadius circleBorder30 = BorderRadius.circular(30.r);

  static BorderRadius circleBorder63 = BorderRadius.circular(63.r);

  static BorderRadius roundedBorder10 = BorderRadius.circular(10.r);

  static BorderRadius circleBorder20 = BorderRadius.circular(20.r);

  static BorderRadius roundedBorder2 = BorderRadius.circular(2.r);

  static BorderRadius customBorderBL8 = BorderRadius.only(
    topRight: Radius.circular(8.r),
    bottomLeft: Radius.circular(8.r),
    bottomRight: Radius.circular(8.r),
  );

  static BorderRadius txtCircleBorder10 = BorderRadius.circular(10.r);

  static BorderRadius txtCircleBorder25 = BorderRadius.circular(25.r);
}
