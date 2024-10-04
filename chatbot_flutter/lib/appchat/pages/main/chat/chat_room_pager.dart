import 'package:flutter/material.dart';


class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 80 : 70,
        ),
        child: _buildChats(),
      ),
      floatingActionButton: _buildFooter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: [
          Text("Username"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        )
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
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Write your message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send, color: Colors.blue, size: 35),
          ),
        ],
      ),
    );
  }
}