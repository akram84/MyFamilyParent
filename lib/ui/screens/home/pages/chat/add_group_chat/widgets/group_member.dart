import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/index.dart';
import 'package:my_family/ui/widgets/app_text_display.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/core/cubit/chat/add_chat/add_chat_cubit.dart';

import '../../../../../../widgets/app_image.dart';

class GroupMember extends StatelessWidget {
  const GroupMember({Key? key, required this.name, required this.image, required this.selected, this.onTap})
      : super(key: key);

  final String name;
  final String? image;
  final bool selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddChatCubit, AddChatState>(
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.whiteA700,
                child: AppImage(image: image, boxFit: BoxFit.scaleDown),
              ),
              10.widthBox,
              AppText(text: name, style: AppTextStyles.txtRobotoMedium18),
              const Spacer(),
              Container(
                width: 30.w, height: 30.h,
                decoration: selected
                    ? AppBoxDecoration.fillBlue200
                    : AppBoxDecoration.outlineGrey,
                padding: EdgeInsets.all(3.r),
                child: selected ? Center(child: Icon(Icons.check, color: AppHelper.getAppTheme())) : const SizedBox.shrink()
              ),
            ],
          ),
        );
      },
    );
  }
}
