part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class ChangePhoto extends UpdateProfileState {}

class Loading extends UpdateProfileState {}
class Done extends UpdateProfileState {}