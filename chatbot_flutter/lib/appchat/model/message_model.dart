// lib/models/message_model.dart
class MessageModel {
  final String message;
  final String time;
  final bool isMe;

  MessageModel({
    required this.message,
    required this.time,
    required this.isMe,
  });
}
