import 'package:chatbot_flutter/appchat/model/list_user_chat.dart';
import 'package:chatbot_flutter/appchat/model/message.dart';
import 'package:chatbot_flutter/appchat/pages/main/chat/chat_room_pager.dart';
import 'package:chatbot_flutter/appchat/widgets/chat_item.dart';
import 'package:chatbot_flutter/appchat/widgets/appbar/toolbar_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        MessageModel(
            message: 'Let’s meet tomorrow!', time: '10:15 AM', isMe: true),
      ],
    ),
    ChatModel(
      userName: 'Charlie',
      avatarUrl: 'assets/images/3.png',
      time: '10:30 AM',
      messages: [
        MessageModel(
            message: 'Can you send the files?', time: '10:30 AM', isMe: false),
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

  SlidableController? _activeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomChatToolbar(),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: chatDataList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Slidable(
                  key: ValueKey(chatDataList[index].userName),
                  controller: _activeController,
                  closeOnScroll: true, // Sử dụng closeOnScroll để đóng khi cuộn
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                        SlidableAction(
                          onPressed: (context) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${chatDataList[index].userName} has been archived'),
                              ),
                            );
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 184, 54, 244),
                          foregroundColor: Colors.white,
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            final removedChat = chatDataList[index];
                            setState(() {
                              chatDataList.removeAt(index);
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${removedChat.userName} has been deleted'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    setState(() {
                                      chatDataList.insert(index, removedChat);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ChatItem(
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
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }
  }
