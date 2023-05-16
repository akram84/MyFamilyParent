part of 'group_chat_cubit.dart';

@immutable
abstract class GroupChatState {}

class GroupChatInitial extends GroupChatState {}

class ChatInitial extends GroupChatState {}
class Init extends GroupChatState {}

class ToggleTab extends GroupChatState {}

class OnTextChange extends GroupChatState {}


class MessagesGot extends GroupChatState {}
class MessageAdded extends GroupChatState {}