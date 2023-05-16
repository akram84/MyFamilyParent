import 'package:flutter/material.dart';

import '../helper/app_toast.dart';

class DoubleBackToCloseWidget extends StatefulWidget {
  final Widget child; // Make Sure this child has a Scaffold widget as parent.

  const DoubleBackToCloseWidget({super.key,
    required this.child,
  });

  @override
  State<DoubleBackToCloseWidget> createState() =>
      _DoubleBackToCloseWidgetState();
}

class _DoubleBackToCloseWidgetState extends State<DoubleBackToCloseWidget> {
  int? _lastTimeBackButtonWasTapped;
  static const exitTimeInMillis = 2000;

  bool get _isAndroid => Theme.of(context).platform == TargetPlatform.android;

  @override
  Widget build(BuildContext context) {
    if (_isAndroid) {
      return WillPopScope(
        onWillPop: _handleWillPop,
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  Future<bool> _handleWillPop() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if(Scaffold.of(context).isDrawerOpen){
      Scaffold.of(context).closeDrawer();
      return false;
    }
    if (_lastTimeBackButtonWasTapped != null && (currentTime - _lastTimeBackButtonWasTapped!) < exitTimeInMillis) {
      AppToast.removeToast();
      return true;
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      AppToast.removeToast();
      AppToast.toast(msg: 'Press again to exit the app');
      return false;
    }
  }
}
