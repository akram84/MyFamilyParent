import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/model/chat/chat.dart';
import '../../../../data/model/chat/group.dart';
import '../../../../data/repository/chat/chat_repo.dart';
import '../../../../data/repository/chat/group_repo.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());

  init(context)async {
    chats = await ChatsRepo().getChats();
    groups = await GroupRepo().getGroups();
    emit(Init());
  }

  /// CHATS
  int selectedTab = 0;
  void toggleTab(index) {
    selectedTab = index;
    emit(ToggleTab());
  }

  List<Chat>? chats;
  List<Group>? groups;

  // Future<void> sendMessage(Message message) async {
  //   debugPrint(message.toJson().toString());
  //   msgController.clear();
  //   await database.collection(messagesCol).add(message.toJson());
  //   chatController.jumpTo(chatController.position.minScrollExtent);
  // }
}
