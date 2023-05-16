part of 'add_member_cubit.dart';

@immutable
abstract class AddMemberState {}

class AddMemberInitial extends AddMemberState {}

class ChangeType extends AddMemberState {}
class ChangeMembersCount extends AddMemberState {}

class Loading extends AddMemberState {}
class Done extends AddMemberState {}
