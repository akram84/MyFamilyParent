import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_family/ui/resources/app_box_decoration.dart';

import '../../../core/cubit/notifications/notifications_cubit.dart';
import '../../helper/app_size_boxes.dart';
import '../../helper/format_duration.dart';
import '../../resources/app_color.dart';
import '../../helper/app_helper.dart';
import '../../resources/app_strings.dart';
import '../../resources/app_text_styles.dart';
import '../../widgets/index.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationsCubit notifications = BlocProvider.of(context)..getNotifications();
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: const AppText(
          translation: 'notifications',
            fontWeight: FontWeight.w700,
            size: 18,
            color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),
      ),
      body: RefreshIndicator(
        onRefresh: () async => notifications.getNotifications(),
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            if(notifications.notifications == null) return const AppLoading();
            if(notifications.notifications!.isEmpty) return Center(child: ListView(shrinkWrap: true, children: [Center(child: AppText(translation: AppStrings.noNotifications))]));
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              itemBuilder: (context, index) {
                final notification = notifications.notifications![index];
                return Card(
                  elevation: 8,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15).r),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                translation: notification.type,
                                style: AppTextStyles.txtRobotoRomanMedium14,
                                color: AppColors.colorSubText,
                              ),
                              10.heightBox,
                              AppText(
                                  translation: notification.text,
                                  maxLines: 5,
                                  style: AppTextStyles.txtRobotoMedium18,
                              ),
                              10.heightBox,
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time_outlined,
                                    color: AppColors.colorSubText,
                                  ),
                                  5.widthBox,
                                  AppText(
                                      translation: formatDuration(notification.date),
                                      style: AppTextStyles.txtRobotoRomanMedium14,
                                      color: AppColors.colorSubText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        5.widthBox,
                        AppButton(
                          translation: AppStrings.forward,
                          padding: EdgeInsets.all(8.r),
                          borderRadius: AppCorners.roundedBorder8,
                          onTap: () => notifications.forwardNotification(notification.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: notifications.notifications!.length,
              separatorBuilder: (BuildContext context, int index) => 10.heightBox,
            );
          },
        ),
      ),
    );
  }
}
