import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family/core/enums/member_type.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_strings.dart';
import 'package:my_family/ui/widgets/app_bar.dart';
import 'package:my_family/ui/widgets/app_text_display.dart';
import 'package:my_family/ui/widgets/helper_permissions.dart';

import '../../../../core/cubit/account/add_member/add_member_cubit.dart';
import '../../../helper/app_helper.dart';
import '../../../widgets/components.dart';
import '../../../resources/app_color.dart';
import '../../../resources/app_text_styles.dart';
import '../../../widgets/app_drop_down.dart';
import '../../../widgets/text_form_field.dart';

class AddFamilyMember extends StatelessWidget {
  const AddFamilyMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMemberCubit()..init(),
      child: BlocBuilder<AddMemberCubit, AddMemberState>(
        builder: (context, state) {
          AddMemberCubit addMember = BlocProvider.of(context);
          return Scaffold(
            appBar: MyAppBar(title: AppStrings.addFamilyMember),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.heightBox,
                    AppText(
                        translation: AppStrings.memberType,
                        style: AppTextStyles.txtRobotoRomanRegular14Black900),
                    16.heightBox,
                    SizedBox(
                      width: 180.w,
                      height: 50.h,
                      child: AppDropDown<MemberType>(
                        hint: AppText(
                          text: addMember.memberType.name,
                          style: AppTextStyles.txtRobotoRegular16
                              .copyWith(color: AppHelper.getAppTheme()),
                        ),
                        items: [MemberType.child, MemberType.helper]
                            .map((item) => DropdownMenuItem<MemberType>(
                                  value: item,
                                  child: Text(
                                    item.name,
                                    style: AppTextStyles.txtRobotoRegular16
                                        .copyWith(color: AppHelper.getAppTheme()),
                                  ),
                                ))
                            .toList(),
                        onChanged: (member) => addMember.changeType(member),
                      ),
                    ),
                    16.heightBox,
                    AppText(
                        translation: 'how_many_helpers',
                        style: AppTextStyles.txtRobotoRomanRegular14Black900),
                    13.heightBox,
                    SizedBox(
                      width: 180.w,
                      height: 50.h,
                      child: AppDropDown<int>(
                        hint: AppText(
                          text: addMember.membersCount.toString(),
                          style: AppTextStyles.txtRobotoRegular16
                              .copyWith(color: AppHelper.getAppTheme()),
                        ),
                        items: addMember.membersCounts
                            .map((item) => DropdownMenuItem<int>(
                                  value: item,
                                  child: Text(
                                    item.toString(),
                                    style: AppTextStyles.txtRobotoRegular16
                                        .copyWith(color: AppHelper.getAppTheme()),
                                  ),
                                ))
                            .toList(),
                        onChanged: (membersCount) =>
                            addMember.changeMembersCount(membersCount ?? 1),
                      ),
                    ),
                    16.heightBox,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            16.heightBox,
                            AppText(translation: AppStrings.emailAddress, style: AppTextStyles.txtRobotoRomanRegular16Black900),
                            7.heightBox,
                            AppFormField(
                              fromKey: addMember.membersKeys[index],
                              hint: AppStrings.enterYourEmail,
                              hintStyle: AppTextStyles.txtRobotoRomanRegular14Bluegray300,
                              keyboardType: TextInputType.emailAddress,
                              controller: addMember.membersControllers[index],
                              borderColor: AppColors.colorInputBorder,
                              maxLines: 1,
                              validate: (val) => val?.isEmpty??true ? 'Email can\'t be empty' : null,
                            ),
                            if(addMember.memberType == MemberType.helper)...[
                              20.heightBox,
                              AppText(translation: AppStrings.permissions, style: AppTextStyles.txtRobotoRomanRegular16Black900),
                              7.heightBox,
                              HelperPermissions(onSelect: (selected) => addMember.selectedPermissions[index] = selected),
                            ]
                          ],
                        );
                      },
                      itemCount: addMember.membersCount,
                    ),
                    35.heightBox,
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 14.w, end: 14.w, top: 35.h, bottom: 20.h),
                      child: AppWidgets.CustomButton(
                        text: 'save',
                        click: () => addMember.addMember(context),
                        radius: 14,
                      ),
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
