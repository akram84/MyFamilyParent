import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_family/ui/widgets/index.dart';

import '../../../../../../core/cubit/calendar/calendar_cubit.dart';
import '../../../../../helper/app_helper.dart';
import '../../../../../helper/index.dart';
import '../../../../../resources/index.dart';
import 'widgets/choose_child.dart';

void addEvent(context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
    ),
    builder: (BuildContext _) {
      return BlocProvider.value(
        value: BlocProvider.of<CalendarCubit>(context),
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            CalendarCubit calendar = BlocProvider.of(context);
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppText(translation: AppStrings.addEvent, style: AppTextStyles.txtRobotoRomanRegular20),
                    20.heightBox,
                    const ChooseEventChild(),
                    16.heightBox,
                    AppFormField(
                      fromKey: calendar.eventNameKey,
                      controller: calendar.eventNameController,
                      hint: AppStrings.eventName,
                      textInputAction: TextInputAction.next,
                      radius: 8.r,
                      borderColor: const Color(0xFFECECEF),
                      validate: (name) => name!.isEmpty ? 'Event name cannot be empty' : null,
                    ),
                    16.heightBox,
                    AppFormField(
                      controller: calendar.eventNoteController,
                      hint: AppStrings.eventNote,
                      textInputAction: TextInputAction.next,
                      radius: 8.r,
                      maxLines: 4,
                      borderColor: const Color(0xFFECECEF),
                    ),
                    16.heightBox,
                    Action(title: calendar.eventDate !=  null ? DateFormat('yMd').format(calendar.eventDate!) : AppStrings.date, icon: 'calendar', onTap: () => calendar.getDate(context)),
                    16.heightBox,
                    Row(
                      children: [
                        Expanded(child: Action(title: calendar.startTime?.format(context) ?? AppStrings.startTime, icon: 'clock', onTap: () => calendar.getStartTime(context))),
                        15.widthBox,
                        Expanded(child: Action(title: calendar.endTime?.format(context) ?? AppStrings.endTime, icon: 'clock', onTap: () => calendar.getEndTime(context))),
                      ],
                    ),
                    16.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(translation: AppStrings.remindMe, style: AppTextStyles.txtRobotoRomanRegular14Bluegray900),
                        Switch(value: calendar.remindMe, onChanged: calendar.toggleRemindMe, ),
                      ]
                    ),
                    33.heightBox,
                    AppButton(
                      translation: AppStrings.createEvent,
                      color: AppHelper.getAppTheme(),
                      onTap: () => calendar.addEvent(context),
                    ),
                    30.heightBox,
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

class Action extends StatelessWidget {
  const Action({Key? key, this.onTap, required this.title, required this.icon}) : super(key: key);

  final void Function()? onTap;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFECECEF)), borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.all(15.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(translation: title, style: AppTextStyles.txtRobotoRomanRegular15),
            ImageIcon(AssetImage('assets/icons/$icon.png'), color: AppColors.blueGray300),
          ],
        ),
      ),
    );
  }
}
