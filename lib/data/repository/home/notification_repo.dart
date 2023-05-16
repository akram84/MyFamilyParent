
import 'package:flutter_easylogger/flutter_logger.dart';

import '../../../ui/helper/app_toast.dart';
import '../../model/notification.dart';
import '../../utils/api_path.dart';
import '../../utils/api_service.dart';

class NotificationsRepo {
  static Future<List<Notification>> getNotifications() async {
    // try {
      final response = await ApiService.getApi(ApiPaths.getNotifications);
      Logger.w(response.data);
      if (response.statusCode == 200) {
        final notifications = (response.data['notifications'] as List?)?.map((e) => Notification.fromJson(e)).toList()??[];
        return notifications;
      } else {
        AppToast.toast(msg: 'Notification retrieving failed');
      }
    // } on Exception catch (e) {
    //   print('ERROR: $e');
    //   AppToast.toast(msg: 'Notification retrieving failed');
    // }
    return [];
  }

  static Future<bool> forwardNotification(notificationID) async{
    try {
      final response = await ApiService.postApi(ApiPaths.forwardNotification, body: {'notificationId': notificationID});
      Logger.w(response.data);
      if(response.statusCode == 201){
        AppToast.toast(msg: response.data['message']??'Notification forwarded successfully');
      } else {
        AppToast.toast(msg: 'Couldn\'t forward notification');
      }
    } on Exception catch (e) {
      print('ERROR: $e');
      AppToast.toast(msg: 'Couldn\'t forward notification');
    }
    return false;
  }
}