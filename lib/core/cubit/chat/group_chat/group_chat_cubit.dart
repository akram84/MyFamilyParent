import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:intl/intl.dart' as intl;
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../data/model/chat/group_message.dart';
import '../../../../data/dto/home/send_message.dart';
import '../../../../data/model/chat/group.dart';
import '../../../../data/repository/user_repository.dart';
import '../../../../data/utils/socket.dart';

part 'group_chat_state.dart';

class GroupChatCubit extends Cubit<GroupChatState> {
  GroupChatCubit() : super(GroupChatInitial());

  late Group selectedGroup;
  init(context, Group selectedGroup) {
    this.selectedGroup = selectedGroup;

    final groupID = selectedGroup.id;
    SocketIO.initSocket(context);
    SocketIO.socket.onConnect((_) async {
      listenOnMessages();
      SocketIO.socket.emit('listGroupMessages', groupID);
    });
  }

  List<GroupMessage>? messages;
  listenOnMessages(){
    // emits when a new message is added
    SocketIO.socket.on('listGroupMessages', (data) {
      messages = (data as List?)?.map((e) => GroupMessage.fromJson(e)).toList()??[];
      emit(MessageAdded());
    });
  }

  void sendMessage(){
    String message = msgController.text.trim();
    if (message.isEmpty) return;

    Logger.w(selectedGroup.id);
    final newMessage = SendMessageDTO(
      chatID: selectedGroup.id,

      senderID: UserRepository.getUser!.id!,
      senderName: UserRepository.getUser!.parentName,

      message: message,
      messageDate: DateTime.now().toString(),
    );

    messages?.add(
      GroupMessage(
        senderID: newMessage.senderID,
        senderName: newMessage.senderName,
        message: newMessage.message,
        messageDate: newMessage.messageDate,
      ),
    );
    emit(MessageAdded());

    Logger.i(newMessage.toJson());
    SocketIO.socket.emit('sendGroupMessage', newMessage.toJson());
    msgController.clear();
  }


  // UI
  ScrollController chatController = ScrollController();
  TextEditingController msgController = TextEditingController();

  TextDirection textDirection = TextDirection.ltr;

  void onTextChange(String text){
    if(text.isEmpty){
      textDirection = TextDirection.ltr;
      emit(OnTextChange());
      return;
    }
    textDirection = getDirection(text);
    emit(OnTextChange());
  }

  bool checkDirectionality(text) => intl.Bidi.detectRtlDirectionality(text);

  TextDirection getDirection(text) => checkDirectionality(text) ? TextDirection.rtl : TextDirection.ltr;
}
