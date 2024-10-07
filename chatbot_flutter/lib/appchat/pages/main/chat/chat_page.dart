
import 'package:chatbot_flutter/appchat/model/list_user_chat.dart';
import 'package:chatbot_flutter/appchat/model/message.dart';
import 'package:chatbot_flutter/appchat/pages/main/chat/chat_room_pager.dart';
import 'package:chatbot_flutter/appchat/widgets/chat_item.dart';
import 'package:chatbot_flutter/appchat/widgets/appbar/toolbar_chat_widget.dart';
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
      avatarUrl: 'assets/images/7.png',
      time: '10:00 AM',
      messages: [
        MessageModel(message: 'Hello!', time: '9:50 AM', isMe: false),
        MessageModel(message: 'Hi, how are you?', time: '10:00 AM', isMe: true),
      ],
    ),
    ChatModel(
      userName: 'Bob',
      avatarUrl: 'assets/images/8.png',
      time: '10:15 AM',
      messages: [
        MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
         MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
          MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
           MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
             MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
         MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: false),
          MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: false),
           MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: false),
             MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: false),
         MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: false),
          MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: false),
           MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
             MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
         MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
          MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
           MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
             MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
         MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
          MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
           MessageModel(message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
      ],
    ),
    ChatModel(
      userName: 'Charlie',
      avatarUrl: 'assets/images/3.png',
      time: '10:30 AM',
      messages: [
        MessageModel(message: 'Can you send the files?', time: '10:30 AM', isMe: false),
      ],
    ),
    ChatModel(
      userName: 'David',
      avatarUrl: 'assets/images/1.png',
      time: '11:00 AM',
      messages: [
        MessageModel(message: 'Good morning!', time: '11:00 AM', isMe: false),
      ],
    ),
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
                     messages: chatDataList[index].messages, 
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
