import 'dart:ui';

import 'package:flutter/material.dart';

import '../../helper/index.dart';
import '../../resources/index.dart';
import '../index.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    this.headerText,
    required this.children,
    this.confirmText,
    this.cancelText,
    this.hasActions = true,
      this.onConfirm,
      this.centeredOneAction = false,
      required this.spaceBeforeActions,
      required this.spaceAfterActions});

  final String? headerText;
  final String? confirmText;
  final String? cancelText;
  final bool hasActions;
  final List<Widget> children;
  final void Function()? onConfirm;
  final bool centeredOneAction;
  final double spaceBeforeActions;
  final double spaceAfterActions;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(color: AppColors.lightWhite, borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context),
            _buildPopUpContent(context),
            if(hasActions) ...[
              spaceBeforeActions.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildConfirmButton(context),
                  if(!centeredOneAction)_buildCancelButton(context),
                ],
              ),
              spaceAfterActions.heightBox,
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildPopUpContent(context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return headerText != null ? AppText(
      translation: headerText,
      color: AppColors.lightWhite,
      style: AppTextStyles.txtRobotoBold20,
    ) : const SizedBox.shrink();
  }

  Widget _buildConfirmButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AppButton(
        width: 132.w,
        height: 43.h,
        style: AppTextStyles.txtRobotoRegular16.copyWith(color: AppColors.lightWhite),
        borderRadius: AppCorners.roundedBorder20,
        translation: confirmText,
        onTap: onConfirm ?? () => pop(context),
        color: AppColors.blue,
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return AppButton(
      translation: cancelText,
      width: 132.w,
      height: 43.h,
      style: AppTextStyles.txtInterSemiBold16.copyWith(color: AppColors.colorDark),
      decoration: AppBoxDecoration.outlineBlack900.copyWith(borderRadius: AppCorners.roundedBorder20),
      onTap: () => pop(context),
    );
  }
}
