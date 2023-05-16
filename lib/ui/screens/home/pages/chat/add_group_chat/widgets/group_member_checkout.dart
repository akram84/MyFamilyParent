import 'package:flutter/material.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import '../../../../../../resources/index.dart';
import '../../../../../../widgets/index.dart';

class GroupMemberCheckout extends StatelessWidget {
  const GroupMemberCheckout(
      {Key? key, required this.name, required this.image, this.onRemove})
      : super(key: key);

  final String? name;
  final String? image;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              AppImage(width: 70.w, height: 70.h, image: image),
              InkWell(
                onTap: onRemove,
                child: Container(
                  width: 18.w,
                  height: 18.h,
                  decoration: AppBoxDecoration.outlineGray1007f.copyWith(shape: BoxShape.circle),
                  child: Icon(Icons.clear, size: 15.sp, color: AppHelper.getAppTheme(),),
                ),
              ),
            ],
          ),
          5.heightBox,
          AppText(
            text: name,
            style: AppTextStyles.txtRobotoRomanRegular14Black900,
          ),
        ],
      ),
    );
  }
}
