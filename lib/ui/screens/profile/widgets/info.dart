import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../resources/index.dart';
import '../../../widgets/index.dart';

class Info extends StatelessWidget {
  const Info({Key? key, this.onChatTap, this.onLocationTap, required this.name, required this.type, required this.image}) : super(key: key);

  final String name;
  final String type;
  final String? image;
  final void Function()? onChatTap;
  final void Function()? onLocationTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomIconButton(
            height: 40.h,
            width: 40.w,
            variant: IconButtonVariant.OutlineBlack9003f,
            shape: IconButtonShape.CircleBorder20,
            padding: IconButtonPadding.PaddingAll7,
            onTap: onChatTap,
            child: const AppImage(imagePath: AppImages.chat),
          ),
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: AppImage(
              image: image,
              height: 125.h,
              width: 126.w,
            ),
          ),
          CustomIconButton(
            height: 40.h,
            width: 40.w,
            variant: IconButtonVariant.OutlineBlack9003f,
            shape: IconButtonShape.CircleBorder20,
            padding: IconButtonPadding.PaddingAll7,
            onTap: onLocationTap,
            child: const AppImage(imagePath: AppImages.location),
          ),
        ]),
        17.heightBox,
        Text(name.tr, style: AppTextStyles.txtRobotoRomanSemiBold24),
        9.heightBox,
        Text(type.tr, style: AppTextStyles.txtRobotoRomanRegular16Black900),
      ],
    );
  }
}
