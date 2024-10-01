import 'package:chatbot_flutter/widget/toolbar_chat_widget.dart';
import 'package:flutter/material.dart';

class ChatPageNavigation extends StatelessWidget {
  const ChatPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomChatToolbar(),
      body: const Center(
        child: Text("Tin nhắn"),
      ),
    );
  }
}
