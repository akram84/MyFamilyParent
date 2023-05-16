import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/repository/user_repository.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_box_decoration.dart';
import 'package:my_family/ui/resources/app_images.dart';
import 'package:my_family/ui/resources/app_strings.dart';
import 'package:my_family/ui/screens/auth/login_screen.dart';
import 'package:my_family/ui/screens/settings/account/add_family_member.dart';
import 'package:my_family/ui/screens/settings/account/change_password.dart';
import 'package:my_family/ui/widgets/app_bar.dart';

import '../../../helper/app_helper.dart';
import '../../../resources/app_color.dart';
import '../../../resources/app_routes.dart';
import '../../../resources/app_text_styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_image.dart';
import '../../../widgets/app_text_display.dart';
import '../../../widgets/components.dart';
import '../../../widgets/custom_icon_button.dart';
import 'update_profile.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: AppStrings.editAccount),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Item(icon: AppImages.edit, text: AppStrings.editFamilyInfo, onTap: () => pushPage(context, const UpdateProfile())),
            35.heightBox,
            Item(icon: AppImages.edit2, text: AppStrings.editFamilyPassword, onTap: () => pushPage(context, const ChangePasswordScreen())),
            35.heightBox,
            Item(icon: AppImages.add, text: AppStrings.addFamilyMember, onTap: () => pushPage(context, const AddFamilyMember())),
            50.heightBox,
            AppButton(
              borderRadius: AppCorners.roundedBorder8,
              color: AppColors.redA700B2,
              translation: AppStrings.deactivateAccount,
              onTap: () => showDeactivateBottomSheet(context),
            )
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({Key? key, required this.icon, required this.text, required this.onTap}) : super(key: key);

  final String icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CustomIconButton(
            height: 44.h,
            width: 44.w,
            shape: IconButtonShape.RoundedBorder12,
            child: AppImage(imagePath: icon),
          ),
          24.widthBox,
          AppText(
            translation: text,
            style: AppTextStyles.txtRobotoRomanRegular18,
          ),
        ],
      ),
    );
  }
}

void showDeactivateBottomSheet(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300.h,
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              Container(
                height: 4.h,
                width: 50.w,
                margin: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.r)),
              ),
              20.heightBox,
              AppText(translation: AppStrings.deactivateAccount, size: 20.sp, fontWeight: FontWeight.w700),
              14.heightBox,
              AppText(
                translation: AppStrings.deactivateAccountMsg,
                size: 16.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              50.heightBox,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: AppWidgets.CustomButton(
                        radius: 8.r,
                        background: AppColors.redA700B2,
                        borderColor: AppColors.redA700B2,
                        text: AppStrings.deactivateAccount.tr,
                        isUpperCase: false,
                        click: () async {
                          final deactivated = await UserRepository.deactivateAccount();
                          if(deactivated){
                            popAllAndPushNamesWOContext(AppRoutes.login);
                          }
                        },
                      ),
                    ),
                  ),
                  20.widthBox,
                  Expanded(
                    child: Container(
                      child: AppWidgets.CustomButton(
                        radius: 8.r,
                        background: AppColors.lightWhite,
                        borderColor: AppHelper.getAppTheme(),
                        text: AppStrings.cancel.tr,
                        textColor: AppHelper.getAppTheme(),
                        isUpperCase: false,
                        click: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
              10.heightBox,
            ],
          ),
        );
      });
}
