import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family/data/repository/member/children_repo.dart';
import 'package:my_family/data/repository/member/helpers_repository.dart';
import 'package:my_family/data/repository/user_repository.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_box_decoration.dart';
import 'package:my_family/ui/resources/app_strings.dart';
import 'package:my_family/ui/widgets/app_bar.dart';
import 'package:my_family/ui/widgets/app_button.dart';
import 'package:my_family/ui/widgets/app_search.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import '../../../../../../core/cubit/chat/add_chat/add_chat_cubit.dart';
import '../../../../../resources/app_text_styles.dart';
import '../../../../../widgets/app_text_display.dart';
import 'create_group_screen.dart';
import 'widgets/group_member.dart';

class SelectMembers extends StatelessWidget {
  const SelectMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddChatCubit(),
      child: BlocBuilder<AddChatCubit, AddChatState>(
        builder: (context, state) {
          final user = UserRepository.user;
          AddChatCubit chat = BlocProvider.of(context);
          return Scaffold(
            appBar: MyAppBar(title: AppStrings.familyMember),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.heightBox,
                        AppSearch(),
                        16.heightBox,
                        AppText(
                            translation: 'parents',
                            style: AppTextStyles.txtRobotoMedium18),
                        12.heightBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GroupMember(name: user?.parentName ?? '', image: user?.image, selected: true),
                            5.heightBox,
                            const Divider(thickness: 2),
                            5.heightBox,
                            GroupMember(name: user?.otherParentName ?? '', image: user?.image, selected: true),
                          ],
                        ),
                        20.heightBox,
                        AppText(translation: 'helpers', style: AppTextStyles.txtRobotoMedium18),
                        12.heightBox,
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: HelpersRepo.helpers.length,
                          itemBuilder: (c, i) {
                            final helper = HelpersRepo.helpers[i];
                            return GroupMember(name: helper.name ?? '', image: helper.image, selected: chat.selectedHelpers[i], onTap: () => chat.toggleHelpers(i));
                          }, separatorBuilder: (c, i) => Padding(padding: EdgeInsets.symmetric(vertical: 5.h), child: const Divider(thickness: 2)),
                        ),
                        20.heightBox,
                        AppText(translation: 'children', style: AppTextStyles.txtRobotoMedium18),
                        12.heightBox,
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: ChildrenRepo.children.length,
                          itemBuilder: (c, i) {
                            final child = ChildrenRepo.children[i];
                            return GroupMember(name: child.name, image: child.image, selected: chat.selectedChildren[i], onTap: () => chat.toggleChildren(i));
                          }, separatorBuilder: (c, i) => Padding(padding: EdgeInsets.symmetric(vertical: 5.h), child: const Divider(thickness: 2)),
                        ),
                        100.heightBox,
                      ],
                    ),
                  ),
                ),
                AppButton(
                  translation: AppStrings.next,
                  borderRadius: AppCorners.txtRoundedBorder14,
                  color: AppHelper.getAppTheme(),
                  margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 70.w),
                  onTap: () => pushPage(context, CreateGroupScreen(chat: chat,)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
