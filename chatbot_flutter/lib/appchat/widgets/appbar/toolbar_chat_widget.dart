import 'package:chatbot_flutter/appchat/pages/main/contacts/add_friend_page.dart';
import 'package:chatbot_flutter/appchat/pages/main/chat/create_group_page.dart';
import 'package:chatbot_flutter/appchat/pages/main/chat/mycloud_page.dart';
import 'package:chatbot_flutter/appchat/pages/qr/scan_qr_page.dart';
import 'package:flutter/material.dart';

class CustomChatToolbar extends StatelessWidget implements PreferredSizeWidget {
  CustomChatToolbar({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Tìm kiếm...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              autofocus: true,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScanQrPage(),
                  ),
                );
              },
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.add, color: Colors.white),
              color: Colors.white,
              onSelected: (value) {
                switch (value) {
                  case 'Item 1':
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddFriendPage(),
                      ),
                    );

                    break;
                  case 'Item 2':
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Creategroup(),
                      ),
                    );

                    break;
                  case 'Item 3':
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MycloudPage(),
                      ),
                    );

                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'Item 1',
                    child: Row(
                      children: [
                        Icon(Icons.person_add,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        SizedBox(width: 8),
                        Text('Thêm bạn',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Item 2',
                    child: Row(
                      children: [
                        Icon(Icons.group_add,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        SizedBox(width: 8),
                        Text('Tạo nhóm',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Item 3',
                    child: Row(
                      children: [
                        Icon(Icons.cloud, color: Color.fromARGB(255, 0, 0, 0)),
                        SizedBox(width: 8),
                        Text('Icoud của tôi',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      ],
                    ),
                  ),

                  const PopupMenuItem<String>(
                    value: 'Item 4',
                    child: Row(
                      children: [
                        Icon(Icons.storage_outlined, color: Color.fromARGB(255, 0, 0, 0)),
                        SizedBox(width: 8),
                        Text('Kho lưu trữ',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      ],
                    ),
                  ),
                ];
              },
              offset: const Offset(0, 50),
            ),
          ],
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
