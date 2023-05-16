import 'package:flutter_easylogger/flutter_logger.dart';

import '../../../ui/helper/app_toast.dart';
import '../../model/chat/chat.dart';
import '../../utils/api_path.dart';
import '../../utils/api_service.dart';

class ChatsRepo{
  Future<List<Chat>> getChats() async{
    try {
      final response = await ApiService.getApi(ApiPaths.getChats);
      Logger.w(response.data);
      if(response.statusCode == 200){
        final List<Chat> chats = (response.data['records'] as List?)?.map((chat) => Chat.fromJson(chat)).toList()??[];
        AppToast.toast(msg: 'Chats retrieved');
        return chats;
      } else {
        AppToast.toast(msg: response.data['error']??'Chats retrieving failed');
      }
    } on Exception catch (e) {
      print('ERROR: $e');
      AppToast.toast(msg: 'Chats retrieving failed');
    }
    return [];
  }

  // Future<bool> startChat(CreateChatDTO createChatDTO) async{
  //   try {
  //     final response = await ApiService.postApi(ApiPaths.createChat, body: createChatDTO.toJson());
  //     Logger.w(response);
  //     if(response.statusCode == 200){
  //       AppToast.toast(msg: response.data['message']??'Chat Added Successfully');
  //
  //     } else {
  //       AppToast.toast(msg: 'Couldn\'t add study');
  //     }
  //     return response.data['success'];
  //   } on Exception catch (e) {
  //     print('ERROR: $e');
  //     AppToast.toast(msg: 'Chats retrieving failed');
  //     return false;
  //   }
  // }
}