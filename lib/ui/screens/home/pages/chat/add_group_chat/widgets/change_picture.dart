import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/widgets/components.dart';

import '../../../../../../resources/index.dart';
import '../../../../../../widgets/app_image.dart';

Future<void> changePicture(context, cubit) async{
  await AwesomeDialog(
    context: context,
    animType: AnimType.bottomSlide,
    padding: EdgeInsets.zero,
    bodyHeaderDistance: 0.0,
    isDense: true,
    dialogType: DialogType.noHeader,
    body: GroupPicDialog(cubit: cubit,),
  ).show();
}

class GroupPicDialog extends StatefulWidget {
  const GroupPicDialog({super.key, required this.cubit});

  final cubit;

  @override
  State<GroupPicDialog> createState() => _GroupPicDialogState();
}

class _GroupPicDialogState extends State<GroupPicDialog> {
  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = widget.cubit.selectedPicIndex??0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 40.w, vertical: 23.h),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          AppText.medium(text: AppStrings.chooseFamilyAvatar),
          17.heightBox,
          GridView.builder(
            shrinkWrap: true,
            itemCount: widget.cubit.groupPics.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 12.h,
            ),
            itemBuilder: (c, index) =>  InkWell(
              onTap: () => setState(() => selectedIndex = index),
              child: Stack(
                children: [
                  Container(
                    foregroundDecoration: selectedIndex == index ? BoxDecoration(color: AppColors.black900.withOpacity(0.2), shape: BoxShape.circle) : null,
                    child: AppImage(
                      imagePath: widget.cubit.groupPics[index],
                      height: 100.h,
                      width: 100.w,
                    ),
                  ),
                  if(selectedIndex == index)...[
                    Center(
                      child: AppImage(
                        imagePath: AppImages.checkWithBorder,
                        width: 15.w,
                        height: 15.h,
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),
          26.heightBox,
          Container(
            margin: EdgeInsetsDirectional.only(top: 16.r, bottom: 8.r),
            child: AppWidgets.CustomButton(
                text: 'save',
                width: 150.w,
                height: 40.h,
                radius: 50.r,
                background: AppHelper.getAppTheme(),
                borderColor: AppHelper.getAppTheme(),
                click: () {
                  widget.cubit.changeGroupPic(selectedIndex);
                  pop(context);
                }),
          )
        ],
      ),
    );
  }
}
