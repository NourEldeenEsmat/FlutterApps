part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSucsses extends ChatState {
  List<Message> messages = [];
  ChatSucsses({required this.messages});
}
