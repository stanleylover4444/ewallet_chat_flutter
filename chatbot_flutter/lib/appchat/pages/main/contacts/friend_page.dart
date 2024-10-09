import 'package:chatbot_flutter/appchat/pages/main/contacts/friend_request_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  List<bool> _isSelectedList = [false, false, false];

  List<String> friends = [
    "Nguyễn Văn A",
    "Trần Thị B",
    "Phạm Văn C",
    "Lê Thị D",
    "Hoàng Văn E",
    "Nguyễn Văn A",
    "Trần Thị B",
    "Phạm Văn C",
    "Lê Thị D",
    "Hoàng Văn E",
    "Nguyễn Văn A",
    "Trần Thị B",
    "Phạm Văn C",
    "Lê Thị D",
    "Hoàng Văn E"
  ];

  // Danh sách đường dẫn đến các ảnh avatar trong thư mục assets
  List<String> avatars = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
  ];

  void _toggleContainer(int index) {
    setState(() {
      _isSelectedList[index] = !_isSelectedList[index];
    });
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FriendRequestPage()),
        ).then((_) {
          setState(() {
            _isSelectedList = [false, false, false];
          });
        });
        break;
      case 1:
      case 2:
        setState(() {
          _isSelectedList = [false, false, false];
        });
        break;
    }
  }

  Widget _buildItem(String title, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        _toggleContainer(index);
        _navigateToPage(index);
      },
      child: Container(
        height: 50,
        color: _isSelectedList[index]
            ? const Color.fromARGB(255, 141, 204, 255)
            : Colors.white,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: friends.length,
      itemBuilder: (context, index) {
        return Slidable(
          key: ValueKey(friends[index]),  // Sử dụng tên bạn bè làm key
          controller: null,
          closeOnScroll: true,
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${friends[index]} has been archived'),
                    ),
                  );
                },
                backgroundColor: const Color.fromARGB(255, 184, 54, 244),
                foregroundColor: Colors.white,
                icon: Icons.archive,
                label: 'Nhật kí',
              ),
              SlidableAction(
                onPressed: (context) {
                  setState(() {
                    friends.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${friends[index]} has been deleted'),
                    ),
                  );
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Xóa bạn bè',
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(avatars[index % avatars.length]),
            ),
            title: Text(friends[index]),
            onTap: () {
              // Xử lý khi nhấn vào tên bạn
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildItem("Lời mời kết bạn", Icons.person_add, 0),
            _buildItem("Danh bạ máy", Icons.contacts, 1),
            _buildItem("Lịch sinh nhật", Icons.cake, 2),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Danh sách bạn bè",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildFriendList(),
          ],
        ),
      ),
    );
  }
}
