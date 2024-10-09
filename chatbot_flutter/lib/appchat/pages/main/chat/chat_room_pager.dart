import 'package:flutter/material.dart';
import 'package:chatbot_flutter/appchat/model/message_model.dart';

class ChatRoomPage extends StatefulWidget {
  final String userName;
  final String avatarUrl;
  final List<MessageModel> messages;

  const ChatRoomPage({
    super.key,
    required this.userName,
    required this.avatarUrl,
    required this.messages,
  });

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController _messageController = TextEditingController();
  late List<MessageModel> _messages;
  final ScrollController _scrollController =
      ScrollController(); // Thêm ScrollController

  @override
  void initState() {
    super.initState();
    _messages = List.from(widget.messages);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: _buildChats(),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildFooter(),
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
            backgroundImage: AssetImage(widget.avatarUrl),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 11,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    "Online",
                    style: TextStyle(
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
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        final isMe = message.isMe;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMe)
                CircleAvatar(
                  backgroundImage: AssetImage(widget.avatarUrl),
                  radius: 20,
                ),
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isMe
                        ? const Color.fromARGB(255, 165, 213, 253)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.message,
                        style: TextStyle(
                          color: isMe ? Colors.black : Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        message.time,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendMessage() {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add(MessageModel(
          message: messageText,
          time: DateTime.now().toString(),
          isMe: true,
        ));
        _messageController.clear();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      });
    }
  }

  Widget _buildFooter() {
    return Container(
        margin: EdgeInsets.only(top: 100),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.photo, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.emoji_emotions, color: Colors.black),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Viết lời nhắn của bạn ...',
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.send,
                  onSubmitted: (value) {
                    _sendMessage();
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  _sendMessage();
                },
                icon: Icon(Icons.send, color: Colors.black, size: 28),
              ),
            ],
          ),
        ));
  }
}
