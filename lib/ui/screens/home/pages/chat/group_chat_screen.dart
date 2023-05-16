import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/cubit/chat/chats/chats_cubit.dart';
import '../../../../../core/cubit/chat/group_chat/group_chat_cubit.dart';
import '../../../../../data/model/chat/group.dart';
import '../../../../../data/model/chat/group_message.dart';
import '../../../../../data/repository/user_repository.dart';
import '../../../../../data/utils/socket.dart';
import '../../../../../ui/helper/index.dart';
import '../../../../helper/app_helper.dart';
import '../../../../resources/index.dart';
import '../../../../widgets/index.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({Key? key, required this.selectedGroup, required this.context}) : super(key: key);

  final Group selectedGroup;
  final BuildContext context;

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {

  @override
  void dispose() {
    SocketIO.disconnect();
    BlocProvider.of<ChatsCubit>(widget.context).init(widget.context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GroupChatCubit()..init(context, widget.selectedGroup),
      child: BlocBuilder<GroupChatCubit, GroupChatState>(
        builder: (context, state) {
          GroupChatCubit chat = BlocProvider.of(context);
          final user = UserRepository.getUser;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppHelper.getAppTheme(),
              leading: InkWell(
                child: SvgPicture.asset(
                  AppHelper.iconBack(),
                  height: 26.h,
                  width: 26.w,
                  fit: BoxFit.scaleDown,
                ),
                onTap: () => pop(context),
              ),
              leadingWidth: 40.w,
              title: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: AppImage(
                      width: 45.w,
                      height: 45.h,
                      image: widget.selectedGroup.image,
                    ),
                  ),
                  10.widthBox,
                  AppText(
                    text: widget.selectedGroup.groupName,
                    color: AppColors.whiteA700,
                    style: AppTextStyles.txtRobotoBold20,
                  ),
                ],
              ),
              // add description
            ),
            body: Column(
              children: [
                Expanded(
                  child: Builder(
                    builder: (BuildContext context) {
                      if (chat.messages == null) return const AppLoading();
                      if (chat.messages!.isEmpty) return Center(child: Image.asset('assets/images/no_messages.png'));
                      return Container(
                        color: Colors.white,
                        child: ListView(
                          reverse: true,
                          controller: chat.chatController,
                          children: chat.messages!
                              .asMap()
                              .map((index, json) {
                            GroupMessage message = chat.messages![index];
                            return MapEntry(
                                'key$index',
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 14,
                                      right: 14,
                                      top: 2,
                                      bottom: 2),
                                  child: Align(
                                    alignment:
                                    (message.senderID != user?.id
                                        ? Alignment.topLeft
                                        : Alignment.topRight),
                                    child: Column(
                                      crossAxisAlignment:
                                      (message.senderID != user?.id
                                          ? CrossAxisAlignment.start
                                          : CrossAxisAlignment.end),
                                      children: [
                                        if (message.senderID != user?.id && (index == 0 || chat.messages![index - 1].senderName != message.senderName)) ...[
                                          Text(
                                            message.senderName??'',
                                            style: const TextStyle(
                                              color: Colors.cyan,
                                              fontSize: 15,
                                              fontWeight:
                                                  FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: message.senderID != user?.id
                                                ? BorderRadius.all(Radius.circular(15.r)).copyWith(topLeft: Radius.zero)
                                                : BorderRadius.all(Radius.circular(15.r)).copyWith(topRight: Radius.zero),
                                            color: message.senderID != user?.id
                                                ? Colors.grey.shade200
                                                : AppHelper.getAppTheme(),
                                          ),
                                          padding: const EdgeInsets.all(16),
                                          child: Directionality(
                                            textDirection:
                                            chat.getDirection(
                                                message.message??''),
                                            child: Text(
                                              message.message ?? '',
                                              style: const TextStyle(
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        if (index == chat.messages!.length - 1 ||
                                            (chat.messages![index + 1].senderID != message.senderID)) ...[
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: Text(
                                              AppDateFormatter.getFullDate(
                                                  date: message.messageDate,
                                                  format: 'jm'),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ),
                                        ]
                                      ],
                                    ),
                                  ),
                                ));
                          })
                              .values
                              .toList()
                              .reversed
                              .toList(),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.all(10.r),
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        color: AppColors.lightReviewsGray,
                        borderRadius: AppCorners.roundedBorder29
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Directionality(
                            textDirection: chat.textDirection,
                            child: TextField(
                              controller: chat.msgController,
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 5,
                              decoration: const InputDecoration(
                                hintText: "Type a message",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none,
                              ),
                              onChanged: chat.onTextChange,
                            ),
                          ),
                        ),
                        20.widthBox,
                        const AppImage(imagePath: AppImages.gallery),
                        5.widthBox,
                        AppImage(imagePath: AppImages.send, icon: true, onTap: () => chat.sendMessage()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
