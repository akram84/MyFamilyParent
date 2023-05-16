import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:intl/intl.dart' as intl;
import 'package:my_family/data/dto/home/send_message.dart';
import 'package:my_family/data/repository/user_repository.dart';
import 'package:my_family/data/utils/socket.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../data/model/chat/chat.dart';
import '../../../../data/model/chat/message.dart';


part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());


  late Chat selectedChat;
  init(context, Chat selectedChat) {
    this.selectedChat = selectedChat;

    final chatID = selectedChat.id;
    SocketIO.initSocket(context);
    SocketIO.socket.onConnect((_) async {
      if(selectedChat.id != null){
        listenOnMessages();
        SocketIO.socket.emit('listMessages', {'chat': chatID});
      } else {
        messages = [];
        listenOnMessages();
        SocketIO.socket.emit('listMessages', {'sender': selectedChat.senderID});
        emit(MessagesGot());
      }
    });
  }

  List<Message>? messages;
  listenOnMessages(){
    // emits when a new message is added
    SocketIO.socket.on('listMessages', (data) {
      Logger.i('data');
      Logger.i(data);
      messages = (data as List?)?.map((e) => Message.fromJson(e)).toList()??[];
      emit(MessageAdded());
    });
  }

  void sendMessage(){
    String message = msgController.text.trim();
    if (message.isEmpty) return;

    Logger.w(selectedChat.id);
    final newMessage = SendMessageDTO(
      chatID: selectedChat.id,

      senderID: selectedChat.senderID,
      senderName: selectedChat.senderName,
      senderImage: selectedChat.senderImage,

      recieverID: UserRepository.getUser!.id!,
      receiverName: UserRepository.getUser!.parentName,
      receiverImage: UserRepository.getUser?.image,

      message: message,
      messageDate: DateTime.now().toString(),
    );

    messages?.add(Message.fromJson(newMessage.toJson()));
    emit(MessageAdded());

    Logger.i(newMessage.toJson());
    SocketIO.socket.emit('sendMessage', newMessage.toJson());
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
