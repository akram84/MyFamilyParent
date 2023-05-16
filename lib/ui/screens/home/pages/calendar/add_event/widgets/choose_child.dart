import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../../../../resources/app_text_styles.dart';
import '../../../../../../../data/model/children/child.dart';
import '../../../../../../../core/cubit/calendar/calendar_cubit.dart';
import '../../../../../../../data/repository/member/children_repo.dart';
import '../../../../../../widgets/index.dart';

class ChooseEventChild extends StatelessWidget {
  const ChooseEventChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        CalendarCubit calendar = BlocProvider.of(context);
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: AppText(
              text: calendar.eventChild?.name ?? 'name_child'.tr,
              style: AppTextStyles.txtRobotoRomanRegular16Bluegray300,
            ),
            items: ChildrenRepo.children
                .map((item) =>
                DropdownMenuItem<Child>(
                  value: item,
                  child: AppText(
                    text: item.name,
                    style: AppTextStyles.txtRobotoRomanRegular16Bluegray300,
                  ),
                )).toList(),
            onChanged: calendar.changeEventChild,
            icon: const ImageIcon(
              AssetImage('assets/images/arrow_down.png'),
              color: Color(0xff000000),
            ),
            iconSize: 16.sp,
            buttonHeight: 50.h,
            buttonPadding: EdgeInsets.symmetric(horizontal: 14.w),
            buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xFFEDF1F7),
                  width: 1.5.w,
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
        );
      },
    );
  }
}
