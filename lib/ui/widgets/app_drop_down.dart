import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:my_family/ui/helper/index.dart';

import '../resources/app_color.dart';


class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({Key? key, required this.hint, this.items, this.onChanged}) : super(key: key);

  final Widget hint;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        hint: hint,
        items: items,
        onChanged: onChanged,
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
            ), color: Colors.white),
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
  }
}
