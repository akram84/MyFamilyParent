import 'package:flutter/material.dart';

import '../resources/app_color.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.child,
    required this.color,
    required this.borderRadius,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray300,
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
