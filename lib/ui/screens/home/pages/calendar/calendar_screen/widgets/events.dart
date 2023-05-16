import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family/core/cubit/calendar/calendar_cubit.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_strings.dart';
import 'package:my_family/ui/resources/app_text_styles.dart';
import 'builders.dart';
import 'package:my_family/ui/widgets/index.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        final events = BlocProvider.of<CalendarCubit>(context).events;
        if(events == null) return const AppLoading();
        if(events.isEmpty) {
          return Padding(
          padding: EdgeInsets.symmetric(vertical: 35.h),
          child: AppText(translation: AppStrings.noEvents),
        );
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          itemBuilder: (BuildContext context, int index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Builders().colors[index % 3], width: 2.4)),
                    ),
                    6.widthBox,
                    AppText(text: '${events[index].startTime} - ${events[index].endTime}', style: AppTextStyles.txtRobotoRomanRegular12,),
                  ],
                ),
                8.heightBox,
                AppText(text: events[index].eventName, style: AppTextStyles.txtRobotoRomanRegular16Bluegray900),
                if(events[index].note != null)...[
                  8.heightBox,
                  AppText(text: events[index].note, style: AppTextStyles.txtRobotoRomanRegular12),
                ]
              ],
            ),
          ),
          separatorBuilder: (BuildContext context, int index) => 10.heightBox,
          itemCount: events.length,
        );
      },
    );
  }
}
