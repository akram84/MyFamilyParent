import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family/core/cubit/account/update_profile/update_profile_cubit.dart';
import 'package:my_family/data/repository/user_repository.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/widgets/app_bar.dart';

import '../../../resources/index.dart';
import '../../../widgets/index.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, state) {
          UpdateProfileCubit update = BlocProvider.of(context);
          final user = UserRepository.user;
          return Scaffold(
            appBar: MyAppBar(title: AppStrings.updateProfile),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    32.heightBox,
                    Center(
                      child: SizedBox(
                        height: 120.h,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            UserRepository.user?.image != null ? AppImage(
                              image: UserRepository.user?.image,
                              height: 125.h,
                              width: 125.w,
                              boxFit: BoxFit.scaleDown,
                            ) : AppImage(
                              imagePath: update.groupPic,
                              height: 125.h,
                              width: 125.w,
                              boxFit: BoxFit.scaleDown,
                            ),
                            InkWell(
                              onTap: () => update.changePhoto(context, update),
                              child: Container(
                                width: 25.w,
                                height: 25.h,
                                decoration: AppBoxDecoration.outlineGray1007f.copyWith(shape: BoxShape.circle),
                                child: const Center(child: AppImage(imagePath: AppImages.editPhoto)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          14.heightBox,
                          AppText(text: user?.parentName, style: AppTextStyles.txtRobotoRomanSemiBold24),
                          10.heightBox,
                          AppText(text: 'parent', style: AppTextStyles.txtRobotoRomanRegular16Black900),
                        ],
                      ),
                    ),

                    37.heightBox,
                    ProfileInfo(controller: update.nameController, title: 'name', hint: 'enter_your_name'),
                    16.heightBox,
                    ProfileInfo(controller: update.emailController, title: 'email_address', hint: 'enter_your_email'),
                    16.heightBox,
                    ProfileInfo(controller: update.otherParentEmailController, title: 'other_parent_email', hint: 'enter_your_name'),

                    45.heightBox,
                    AppButton(
                      isLoading: state is Loading,
                      translation: 'save',
                      onTap: () => update.updateProfile(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget{
  const ProfileInfo({super.key, required this.controller, required this.title, required this.hint});

  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(translation: title, style: AppTextStyles.txtRobotoRomanRegular16Black900),
        7.heightBox,
        Align(
          alignment: Alignment.centerLeft,
          child: AppFormField(
            hint: hint,
            hintStyle: AppTextStyles.txtRobotoRomanRegular14Bluegray300,
            controller: controller,
            borderColor: AppColors.colorInputBorder,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}