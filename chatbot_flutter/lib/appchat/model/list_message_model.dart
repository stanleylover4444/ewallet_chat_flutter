import 'package:chatbot_flutter/appchat/model/message_model.dart';

class ChatModel {
  final String userName;
  final String avatarUrl;
  final String time;
  final List<MessageModel> messages; 

  ChatModel({
    required this.userName,
    required this.avatarUrl,
    required this.time,
    required this.messages, 
  });

  String get lastMessage => messages.isNotEmpty
      ? messages.last.message
      : ''; 
}
