import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_family/core/cubit/chat/chats/chats_cubit.dart';

import '../../../../../helper/app_helper.dart';
import '../../../../../resources/app_text.dart';


class MessagesTabBar extends StatelessWidget {
  const MessagesTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        ChatsCubit chat = BlocProvider.of(context);
        return ButtonsTabBar(
          onTap: (index) => chat.toggleTab(index),
          physics: const NeverScrollableScrollPhysics(),
          radius: 50,
          backgroundColor: AppHelper.getAppTheme(),
          unselectedBackgroundColor: const Color(0xffF8F6FB),
          unselectedLabelStyle: TextStyle(
              color: AppHelper.getAppTheme(),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
          labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
          tabs: [
            Tab(
              icon: Container(
                  alignment: AlignmentDirectional.center,
                  width: 140.w,
                  child: AppText.medium(
                      text: 'messages',
                      color: chat.selectedTab == 0
                          ? Colors.white
                          : AppHelper.getAppTheme(),
                      textAlign: TextAlign.center)),
              text: "",
            ),
            Tab(
              icon: SizedBox(
                width: 140.w,
                child: Center(
                  child: AppText.medium(
                      text: 'groups',
                      color: chat.selectedTab == 1
                          ? Colors.white
                          : AppHelper.getAppTheme(),
                      textAlign: TextAlign.center),
                ),
              ),
              text: "",
            )
          ],
        );
      },
    );
  }
}
