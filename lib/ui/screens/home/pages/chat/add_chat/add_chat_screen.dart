import 'package:flutter/material.dart';
import 'package:my_family/data/model/chat/chat.dart';
import 'package:my_family/data/repository/member/children_repo.dart';
import 'package:my_family/data/repository/member/helpers_repository.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_strings.dart';
import 'package:my_family/ui/widgets/app_bar.dart';
import 'package:my_family/ui/widgets/app_search.dart';

import '../../../../../resources/app_text_styles.dart';
import '../../../../../widgets/app_text_display.dart';
import '../chat_screen.dart';
import 'member.dart';

class AddChatScreen extends StatelessWidget {
  const AddChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: AppStrings.familyMember),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              AppSearch(),
              16.heightBox,
              AppText(translation: 'helpers', style: AppTextStyles.txtRobotoMedium18),
              12.heightBox,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: HelpersRepo.helpers.length,
                itemBuilder: (c, i) {
                  final helper = HelpersRepo.helpers[i];
                  return InkWell(
                    onTap: () => pushPageReplacement(context, ChatScreen(selectedChat: Chat(senderID: helper.id, senderName: helper.name, senderImage: helper.image))),
                    child: MemberWidget(name: helper.name ?? '', image: helper.image),
                  );
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
                  return InkWell(
                    onTap: () => pushPageReplacement(context, ChatScreen(selectedChat: Chat(senderID: child.id, senderName: child.name, senderImage: child.image))),
                    child: MemberWidget(name: child.name, image: child.image),
                  );
                }, separatorBuilder: (c, i) => Padding(padding: EdgeInsets.symmetric(vertical: 5.h), child: const Divider(thickness: 2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
