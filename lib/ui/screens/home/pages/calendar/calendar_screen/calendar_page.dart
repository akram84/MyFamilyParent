import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family/core/cubit/calendar/calendar_cubit.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/screens/home/pages/calendar/add_event/add_event.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../helper/index.dart';
import '../../../../settings/notifications_screen.dart';
import 'widgets/events.dart';
import 'widgets/builders.dart';
import 'widgets/choose_child.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarCubit()..init(),
      child: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          CalendarCubit calendar = BlocProvider.of(context);
          final builders = Builders();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppHelper.getAppTheme(),
              elevation: 0,
              title: AppText.medium(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  text: 'calendar',
                  color: Colors.white),
              toolbarHeight: 60.h,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => addEvent(context),
              ),
              actions: [
                IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () =>
                        pushPage(context, const NotificationsScreen())),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  10.heightBox,
                  TableCalendar(
                    firstDay: DateTime(DateTime.now().year),
                    lastDay: DateTime(DateTime.now().year + 1),
                    focusedDay: DateTime.now(),
                    weekendDays: const [DateTime.friday, DateTime.tuesday],
                    startingDayOfWeek: StartingDayOfWeek.saturday,
                    selectedDayPredicate: (day) =>
                        isSameDay(calendar.selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) =>
                        calendar.selectDay(selectedDay.copyWith(isUtc: false)),
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: builders.dowBuilder,
                      prioritizedBuilder: (c, day, focusMonth) => builders.dayBuilder(
                          context, day, calendar.selectedDay, focusMonth),
                      selectedBuilder: (c, day, _) =>
                          builders.selectedBuilder(context, day, false),
                      todayBuilder: (c, day, _) =>
                          builders.selectedBuilder(context, day, true),
                    ),
                  ),
                  20.heightBox,
                  const ChooseChild(),
                  20.heightBox,
                  const Events(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
