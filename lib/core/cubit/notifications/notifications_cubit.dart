import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/notification.dart';
import '../../../data/repository/home/notification_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  List<Notification>? notifications;

  Future<void> getNotifications() async{
    notifications = await NotificationsRepo.getNotifications();
    emit(NotificationsRetrieved());
  }

  Future<void> forwardNotification(notificationID) async{
    await NotificationsRepo.forwardNotification(notificationID);
  }
}
