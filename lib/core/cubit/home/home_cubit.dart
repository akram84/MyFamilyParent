import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_family/ui/screens/home/pages/chat/chat_page.dart';
import 'package:my_family/ui/screens/home/pages/home_page.dart';

import '../../../data/model/home_type.dart';
import '../../../ui/screens/home/pages/calendar/calendar_screen/calendar_page.dart';
import '../../../ui/screens/home/pages/family_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> screens = [
    const HomePage(),
    const CalendarPage(),
    const ChatPage(),
    const FamilyPage(),
  ];

  Widget get currentScreen => screens[navIndex];

  int navIndex = 0;
  void changeNav(index){
    navIndex = index;
    emit(ChangeNav());
  }


  int selectedHomeType = 0;
  List<HomeType> listHomeType = [
    HomeType(title: 'entertainments', image: 'entertainment.png', isSelected: true),
    HomeType(title: 'study', image: 'study.png', isSelected: false),
    HomeType(title: 'to_do_list', image: 'to_do_list.png', isSelected: false),
  ];
  void selectHomeType(index){
    selectedHomeType = index;
    emit(SelectHomeType());
  }
}
