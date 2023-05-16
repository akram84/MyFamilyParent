part of 'add_chat_cubit.dart';

@immutable
abstract class AddChatState {}

class AddChatInitial extends AddChatState {}

class ChatInitial extends AddChatState {}

class ToggleHelpers extends AddChatState {}
class ToggleChildren extends AddChatState {}

class ChangeGroupPic extends AddChatState {}