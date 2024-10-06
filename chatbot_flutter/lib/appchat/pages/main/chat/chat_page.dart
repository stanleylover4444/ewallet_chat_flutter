import 'package:chatbot_flutter/appchat/model/list_user_chat';
import 'package:chatbot_flutter/appchat/pages/main/chat/chat_room_pager.dart';
import 'package:chatbot_flutter/appchat/widgets/chat_item.dart';
import 'package:chatbot_flutter/appchat/widgets/toolbar_chat_widget.dart';
import 'package:flutter/material.dart';

class ChatPageNavigation extends StatefulWidget {
  const ChatPageNavigation({super.key});

  @override
  _ChatPageNavigationState createState() => _ChatPageNavigationState();
}

class _ChatPageNavigationState extends State<ChatPageNavigation> {
  final List<ChatModel> chatDataList = [
    ChatModel(
        userName: 'Alice',
        lastMessage: 'Hi, how are you?',
        time: '10:00 AM',
        avatarUrl: 'assets/images/7.png'),
    ChatModel(
        userName: 'Bob',
        lastMessage: 'Let’s meet tomorrow!',
        time: '10:15 AM',
        avatarUrl: 'assets/images/8.png'),
    ChatModel(
        userName: 'Charlie',
        lastMessage: 'Can you send the files?',
        time: '10:30 AM',
        avatarUrl: 'assets/images/3.png'),
    ChatModel(
        userName: 'David',
        lastMessage: 'Good morning!',
        time: '11:00 AM',
        avatarUrl: 'assets/images/1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomChatToolbar(),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: chatDataList.length,
          itemBuilder: (context, index) {
            return ChatItem(
              chatData: chatDataList[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoomPage(
                      userName: chatDataList[index].userName,
                      avatarUrl: chatDataList[index].avatarUrl,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
