import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../data/dto/home/add_event.dart';
import '../../../data/model/calendar/event.dart';
import '../../../data/model/children/child.dart';
import '../../../data/repository/home/calendar_repo.dart';
import '../../../ui/helper/app_toast.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());


  init() async {
    _allEvents = await CalendarRepo.getEvents();
    events = _allEvents?[selectedDay] ?? [];
    emit(Init());
  }

  Child? selectedChild;

  void changeChild(Child? child) {
    selectedChild = child;
    events = _allEvents?[selectedDay]
            ?.where((event) => event.childID == child?.id)
            .toList() ??
        [];
    emit(ChangeChild());
  }

  DateTime selectedDay = DateTime.now()
      .copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  void selectDay(DateTime selectedDay) {
    this.selectedDay = selectedDay;
    selectedChild = null;
    events = _allEvents?[selectedDay] ?? [];
    emit(SelectDay());
  }

  Map<DateTime, List<Event>>? _allEvents;

  Map<DateTime, List<Event>> get allEvents => _allEvents ?? {};

  List<Event>? events;

  // Add Event
  Child? eventChild;

  void changeEventChild(Child? child) {
    eventChild = child;
    emit(ChangeChild());
  }

  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventNoteController = TextEditingController();

  GlobalKey<FormState> eventNameKey = GlobalKey<FormState>();

  DateTime? eventDate;
  void getDate(context) async {
    eventDate = await showDatePicker(
      context: context,
      initialDate: eventDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().copyWith(year: DateTime.now().year + 1),
    );
    emit(SetDate());
  }

  TimeOfDay? startTime;
  void getStartTime(context) async {
    startTime = await showTimePicker(context: context, initialTime: startTime ?? TimeOfDay.now());
    emit(SetStartTime());
  }

  TimeOfDay? endTime;
  void getEndTime(context) async {
    endTime = await showTimePicker(context: context, initialTime: endTime ?? TimeOfDay(hour: TimeOfDay.now().hour + 2, minute: TimeOfDay.now().minute));
    emit(SetEndTime());
  }

  bool remindMe = false;
  void toggleRemindMe(_) {
    remindMe = !remindMe;
    emit(ToggleRemindMe());
  }

  addEvent(context)  async{
    if(selectedChild == null){
      AppToast.toast(msg: 'You have to select a child');
      return;
    }
    if(!eventNameKey.currentState!.validate()) return;
    if(eventDate == null){
      AppToast.toast(msg: 'You have to select a Date');
      return;
    }
    if(startTime == null){
      AppToast.toast(msg: 'You have to select a Start Time');
      return;
    }
    if(endTime == null){
      AppToast.toast(msg: 'You have to select an End Time');
      return;
    }

    final success = await CalendarRepo().addEvent(AddEventDTO(childId: selectedChild!.id, eventName: eventNameController.text, eventNote: eventNoteController.text, date: eventDate!, startTime: startTime!.format(context), endTime: endTime!.format(context), remindsMe: remindMe));
    if(success) {
      init();
      clear();
      pop(context);
    }
  }

  clear() {
    selectedChild = null;
    eventNameController.clear();
    eventNoteController.clear();
    eventDate = null;
    startTime = null;
    endTime = null;
    emit(Clear());
  }

}
