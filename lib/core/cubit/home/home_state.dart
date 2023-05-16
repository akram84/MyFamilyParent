part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeNav extends HomeState {}
class SelectHomeType extends HomeState {}