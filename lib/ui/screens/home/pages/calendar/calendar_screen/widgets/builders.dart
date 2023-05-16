import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_family/core/cubit/calendar/calendar_cubit.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/widgets/app_text_display.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../resources/index.dart';

class Builders {
  Builders();

  final colors = [
    const Color(0xFF0095FF),
    const Color(0xFFA1C2F5),
    const Color(0xFF00B383)
  ];

  Widget dowBuilder(BuildContext context, DateTime day) {
    return Center(
      child: Text(
        DateFormat.E().format(day),
        style: AppTextStyles.txtRobotoRomanMedium13.copyWith(
            color: day.weekday == DateTime.friday
                ? AppColors.colorRed
                : AppColors.blueGray300),
      ),
    );
  }

  Widget selectedBuilder(BuildContext context, DateTime selectedDay, today) {
    return Column(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: today ? const Color(0xFFA1C2F5) : const Color(0xFF735BF2),
              borderRadius: BorderRadius.circular(10.r)),
          child: Center(
            child: AppText(
              text: selectedDay.day.toString(),
              style: AppTextStyles.txtRobotoRomanBold15,
            ),
          ),
        ),
        3.heightBox,
        _dots(context, selectedDay),
      ],
    );
  }

  Widget? dayBuilder(BuildContext context, DateTime day, selectedDay, focusMonth) {
    if (isSameDay(day, selectedDay) ||
        isSameDay(day, DateTime.now())) return null;
    if(day.month > focusMonth.month) return const SizedBox.shrink();
    return Column(
      children: [
        SizedBox(
          width: 35,
          height: 35,
          child: Center(
            child: AppText(
              text: day.day.toString(),
              style: AppTextStyles.txtRobotoRomanBold15
                  .copyWith(color: AppColors.blueGray900),
            ),
          ),
        ),
        2.heightBox,
        _dots(context, day),
      ],
    );
  }

  _dots(BuildContext context, DateTime currDay) {
    currDay = currDay.copyWith(isUtc: false);
    final events = BlocProvider.of<CalendarCubit>(context).allEvents;
    final dots = (events[currDay]?.length??0) > 3 ? 3 : events[currDay]?.length??0;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(dots, (index) => Container(
                  width: 5,
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 0.5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: colors[index], width: 1.2)),
                ))
            .toList());
  }
}
