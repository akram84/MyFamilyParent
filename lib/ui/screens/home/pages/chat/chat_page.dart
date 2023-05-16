import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_family/core/cubit/chat/chats/chats_cubit.dart';
import 'package:my_family/ui/screens/home/pages/chat/widgets/groups_chats.dart';
import 'package:my_family/ui/widgets/app_bar.dart';

import '../../../../helper/navigator.dart';
import 'add_chat/add_chat_screen.dart';
import 'add_group_chat/select_members.dart';
import 'widgets/chats.dart';
import 'widgets/tab_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsCubit()..init(context),
      child: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          ChatsCubit chat = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: MyAppBar(
              title: 'messages',
              leading: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => pushPage(context, chat.selectedTab == 0 ? const AddChatScreen() : const SelectMembers()),
                ),
              ],
            ),
            body: DefaultTabController(
              length: 2,
              initialIndex: chat.selectedTab,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50).r, color: const Color(0xffF8F6FB)),
                    child: const MessagesTabBar(),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Chats(),
                        GroupsChats(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
