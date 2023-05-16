import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family/core/cubit/chat/chats/chats_cubit.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/widgets/loading.dart';

import '../../../../../../data/model/chat/group.dart';
import '../../../../../widgets/app_image.dart';
import '../../../../../widgets/app_text_display.dart';
import '../group_chat_screen.dart';

class GroupsChats extends StatelessWidget {
  const GroupsChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        ChatsCubit chat = BlocProvider.of(context);
        if (chat.groups == null) return const AppLoading();
        if (chat.groups!.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(8.w),
            child: const Center(child: AppText(text: 'There are no groups')),
          );
        }
        return Container(
          margin: EdgeInsets.only(left: 8.r, right: 8.r),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: chat.groups!.length,
            itemBuilder: (context, index) => InkWell(onTap: () => pushPage(context, GroupChatScreen(selectedGroup: chat.groups![index], context: context)), child: buildGroupItem(chat.groups![index])),
            separatorBuilder: (context, index) => Container(
              margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
              width: double.infinity,
              height: 2,
              color: AppColors.lightReviewsGray,
            ),
          ),
        );
      },
    );
  }
}

Widget buildGroupItem(Group group) => Container(
      margin: const EdgeInsetsDirectional.all(8),
      height: 80,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: AppImage(image: group.image),
            ),
            10.widthBox,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: group.groupName,
                    size: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  4.heightBox,
                  AppText(
                    text: group.lastMessage,
                    color: AppColors.colorSubText2,
                    size: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            AppText(
              text: AppDateFormatter.getFullDate(date: group.lastMessageDate, format: 'jm'),
              color: AppColors.colorSubText2,
              size: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
