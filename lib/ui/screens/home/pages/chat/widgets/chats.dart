import 'package:flutter/material.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family/core/cubit/chat/chats/chats_cubit.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/screens/home/pages/chat/chat_screen.dart';

import '../../../../../../data/model/chat/chat.dart';
import '../../../../../widgets/index.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        ChatsCubit chat = BlocProvider.of(context);
        if (chat.chats == null) return const AppLoading();
        if (chat.chats!.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(8.w),
            child: const Center(child: AppText(text: 'There are no chats')),
          );
        }
        return Container(
          margin: EdgeInsets.only(left: 8.r, right: 8.r),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: chat.chats!.length,
            itemBuilder: (context, index) => InkWell(onTap: () => pushPage(context, ChatScreen(selectedChat: chat.chats![index], context: context,)), child: buildChatItem(chat.chats![index])),
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
  Widget buildChatItem(Chat chat) => Container(
    margin: const EdgeInsetsDirectional.all(8),
    height: 80,
    color: Colors.white,
    child: Container(
      margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: AppImage(image: chat.senderImage),
          ),
          10.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: chat.senderName,
                  size: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                10.heightBox,
                AppText(
                  text: chat.lastMessage,
                  color: AppColors.colorSubText2,
                  size: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          AppText(
            text: AppDateFormatter.getFullDate(date: chat.lastMessageDate, format: 'jm'),
            color: AppColors.colorSubText2,
            size: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    ),
  );
}