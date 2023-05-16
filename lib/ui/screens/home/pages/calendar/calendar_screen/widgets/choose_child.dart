import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_family/core/cubit/calendar/calendar_cubit.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../../../../../data/model/children/child.dart';
import '../../../../../../../data/repository/member/children_repo.dart';
import '../../../../../../helper/app_helper.dart';
import '../../../../../../resources/app_color.dart';
import '../../../../../../resources/app_text.dart';

class ChooseChild extends StatelessWidget {
  const ChooseChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        CalendarCubit calendar = BlocProvider.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(start: 16, top: 30),
              child: AppText.medium(
                  text: 'choose-child_todo',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, top: 16),
              width: double.infinity.w,
              height: 50.h,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: AppText.medium(
                    text: calendar.selectedChild?.name ?? 'name_child'.tr,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppHelper.getAppTheme(),
                  ),
                  items: ChildrenRepo.children
                      .map((item) =>
                      DropdownMenuItem<Child>(
                        value: item,
                        child: Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppHelper.getAppTheme(),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                      .toList(),
                  onChanged: calendar.changeChild,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 32,
                    color: Color(0xff000000),
                  ),
                  iconSize: 14.sp,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  buttonHeight: 50.h,
                  buttonWidth: 40.w,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(
                        color: AppColors.colorInputBorder,
                        width: 0.5,
                      ),
                      color: Colors.white),
                  itemHeight: 50,
                  dropdownMaxHeight: 180,
                  dropdownWidth: 180,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(10, 0),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
