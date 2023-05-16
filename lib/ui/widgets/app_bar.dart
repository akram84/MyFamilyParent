import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_family/ui/helper/index.dart';

import '../helper/app_helper.dart';
import '../resources/app_text.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key, required this.title, this.actions, this.leading = true}) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final bool leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppHelper.getAppTheme(),
      elevation: 0,
      title: AppText.medium(
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
          text: title, color: Colors.white),
      toolbarHeight: 60.h,
      centerTitle: true,
      leading: leading ? InkWell(
          child: SvgPicture.asset(AppHelper.iconBack(), height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
          onTap: () => pop(context),
      ) : const SizedBox.shrink(),
      actions: actions
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
