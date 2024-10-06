import 'package:flutter/material.dart';

class ChatRoomPage extends StatelessWidget {
  final String userName;
  final String avatarUrl;

  const ChatRoomPage({
    super.key,
    required this.userName,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70), // Tạo khoảng trống cho footer
            child: _buildChats(), // Danh sách tin nhắn
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildFooter(), // Footer cố định dưới đáy
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(avatarUrl),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 11,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    "Online",
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.call),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.videocam),
          onPressed: () {},
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget _buildChats() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Message $index'),
          subtitle: Text('Content of message $index'),
        );
      },
      itemCount: 10,
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // Xử lý thêm hình ảnh hoặc biểu tượng cảm xúc
            },
            icon: Icon(Icons.photo, color: Colors.blueGrey),
          ),
          IconButton(
            onPressed: () {
              // Xử lý mở keyboard emoji hoặc thêm ảnh
            },
            icon: Icon(Icons.emoji_emotions, color: Colors.blueGrey),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Write your message...',
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.send,
              onSubmitted: (value) {
                // Xử lý gửi tin nhắn
              },
            ),
          ),
          IconButton(
            onPressed: () {
              // Xử lý gửi tin nhắn
            },
            icon: Icon(Icons.send, color: Colors.blue, size: 28),
          ),
        ],
      ),
    );
  }
}
