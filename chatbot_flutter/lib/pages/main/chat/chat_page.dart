import 'package:chatbot_flutter/pages/main/chat/chat_room_pager.dart';
import 'package:flutter/material.dart';


class ChatPageNavigation extends StatelessWidget {
  const ChatPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List'),
      ),
      body: ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('User $index'),
            subtitle: Text('Last message from User $index'),
            onTap: () {
            
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatRoomPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
