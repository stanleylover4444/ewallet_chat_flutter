import 'package:chatbot_flutter/pages/main/bottomnav/chat/addfriend_page.dart';
import 'package:chatbot_flutter/pages/main/bottomnav/chat/creategroup.dart';
import 'package:chatbot_flutter/pages/main/bottomnav/chat/mycloud_page.dart';
import 'package:chatbot_flutter/pages/main/bottomnav/chat/scanqr_page.dart';
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
            onPressed: () {
              // Xử lý khi nhấn vào biểu tượng tìm kiếm
            },
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
                        builder: (context) =>  const ScanqrPage(),
                      ),
                    );
              },
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.add, color: Colors.white),
              color: Colors.white, // Đặt màu nền cho popup menu
              onSelected: (value) 
                 {
               
                switch (value) {
                  case 'Item 1':
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  const AddfriendPage(),
                      ),
                    );
                  
                    break;
                  case 'Item 2':
                   Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  const Creategroup(),
                      ),
                    );
                  
                    break;
                  case 'Item 3':
                   Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  const MycloudPage(),
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
                        Icon(Icons.person_add, color: Color.fromARGB(255, 0, 0, 0)) , 
                        SizedBox(width: 8),
                        Text('Thêm bạn', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Item 2',
                    child: Row(
                      children: [
                        Icon(Icons.group_add, color: Color.fromARGB(255, 0, 0, 0)), // Thay bằng icon tương ứng
                        SizedBox(width: 8),
                        Text('Tạo nhóm', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))), // Đặt màu cho text
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Item 3',
                    child: Row(
                      children: [
                        Icon(Icons.cloud, color: Color.fromARGB(255, 0, 0, 0)), // Thay bằng icon tương ứng
                        SizedBox(width: 8),
                        Text('Icoud của tôi', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))), // Đặt màu cho text
                      ],
                    ),
                  ),
                ];
              },
              offset: const Offset(0, 50), // Điều chỉnh vị trí mở của popup menu
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
