part of 'calendar_cubit.dart';

@immutable
abstract class CalendarState {}

class CalendarInitial extends CalendarState {}
class Init extends CalendarState {}

class ChangeChild extends CalendarState {}
class SelectDay extends CalendarState {}

class ToggleRemindMe extends CalendarState {}

class Clear extends CalendarState {}

class SetDate extends CalendarState {}
class SetStartTime extends CalendarState {}
class SetEndTime extends CalendarState {}
