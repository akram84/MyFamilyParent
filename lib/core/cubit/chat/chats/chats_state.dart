part of 'chats_cubit.dart';

@immutable
abstract class ChatsState {}

class ChatsInitial extends ChatsState {}
class Init extends ChatsState {}

class ToggleTab extends ChatsState {}

class OnTextChange extends ChatsState {}
