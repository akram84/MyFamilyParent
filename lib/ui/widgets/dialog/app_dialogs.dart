import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/index.dart';
import 'alert_dialog.dart';

class AppDialogs {
  static void showAlertDialog(
      BuildContext context, {
        String? headerText,
        required List<Widget> children,
        String? confirmText = AppStrings.ok,
        String? cancelText = AppStrings.cancel,
        void Function()? onConfirm,
        bool dismissible = true,
        hasActions = true,
        centeredOneAction = false,
        double spaceAfterActions = 40.0,
        double spaceBeforeActions = 45.0,
      }) {
    AwesomeDialog(
      context: context,
      animType: AnimType.bottomSlide,
      padding: EdgeInsets.zero,
      bodyHeaderDistance: 0.0,
      isDense: true,
      // outterPadding: EdgeInsets.symmetric(horizontal: 20.w),
      body: AppAlertDialog(
        headerText: headerText,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        hasActions: hasActions,
        centeredOneAction: centeredOneAction,
        spaceAfterActions: spaceAfterActions,
        spaceBeforeActions: spaceBeforeActions,
        children: children,
      ),
      dialogType: DialogType.noHeader,
      dismissOnBackKeyPress: dismissible,
      dismissOnTouchOutside: dismissible,
    ).show();
  }
}
