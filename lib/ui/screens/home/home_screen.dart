
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import '../../../core/cubit/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppHelper.statusBarColor(isHome: true);
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit home = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: AppColors.colorBackground,
            body: home.currentScreen,
            bottomNavigationBar: Container(
              margin: EdgeInsetsDirectional.only(
                  start: 10.r, end: 10.r, top: 20.r, bottom: 20.r),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: AppHelper.getAppTheme(),
                  borderRadius: BorderRadius.circular(14.r)),
              child: BottomNavigationBar(
                elevation: 20,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: AppHelper.getAppTheme(),
                currentIndex: home.navIndex,
                items: _bottomNavigationBarItems(),
                onTap: (navIndex) => home.changeNav(navIndex),
              ),
            ),
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() => [
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('${Const.icons}icon_home.svg', color: AppHelper.getAppTheme()),
            icon: SvgPicture.asset('${Const.icons}icon_home.svg'),
            label: 'home'.tr),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('${Const.icons}icon_calendar.svg', color: AppHelper.getAppTheme()),
            icon: SvgPicture.asset('${Const.icons}icon_calendar.svg'),
            label: 'calendar'.tr),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('${Const.icons}icon_messages.svg', color: AppHelper.getAppTheme()),
            icon: SvgPicture.asset('${Const.icons}icon_messages.svg'),
            label: 'messages'.tr),
        BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('${Const.icons}icon_family.svg', color: AppHelper.getAppTheme()),
            icon: SvgPicture.asset('${Const.icons}icon_family.svg'),
            label: 'family'.tr),
      ];
}
