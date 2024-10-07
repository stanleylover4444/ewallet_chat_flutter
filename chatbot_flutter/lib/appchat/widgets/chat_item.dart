
import 'package:chatbot_flutter/appchat/model/list_user_chat.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chatData;
  final VoidCallback onTap;

  const ChatItem({Key? key, required this.chatData , required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        
        onTap: onTap, 
        child: Container( 
           margin: EdgeInsets.symmetric(horizontal:10),
           padding: EdgeInsets.symmetric(vertical: 7),
          child:  Row(
          
          children: [
            CircleAvatar(
              radius: 28.0,
              backgroundImage: AssetImage(chatData.avatarUrl), 
            ),
            const SizedBox(width: 16), 
         
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatData.userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4), 
                  Text(
                    chatData.lastMessage,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis, 
                  ),
                ],
              ),
            ),
       
            Text(
              chatData.time,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}
