import 'package:flutter/cupertino.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../ui/helper/app_toast.dart';
import '../../model/chat/message.dart';
import '../../utils/api_path.dart';
import '../../utils/api_service.dart';

class MessagesRepo{
  static late IO.Socket socket;
  static initSocket(BuildContext context, chatID) {
    final base = ApiPaths.base.substring(0, ApiPaths.base.length - 6);
    socket = IO.io(base, IO.OptionBuilder().setTransports(['websocket']).build());

    socket.onDisconnect((_) {
      if(context.mounted) pop(context);
      print('Connection Disconnection');
    });
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }

  static Future<List<Message>> getMessages(chatID) async{
    try {
      final response = await ApiService.getApi(ApiPaths.getMessages, params: {'chat': chatID});
      Logger.w(response.data);
      if(response.statusCode == 200){
        final List<Message> messages = (response.data['messages'] as List?)?.map((chat) => Message.fromJson(chat)).toList()??[];
        return messages;
      } else {
        AppToast.toast(msg: response.data['error']??'Messages retrieving failed');
      }
    } on Exception catch (e) {
      print('ERROR: $e');
      AppToast.toast(msg: 'Messages retrieving failed');
    }
    return [];
  }
}