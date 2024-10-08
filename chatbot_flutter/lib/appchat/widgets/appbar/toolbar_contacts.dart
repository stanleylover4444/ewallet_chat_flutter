import 'package:chatbot_flutter/appchat/pages/main/contacts/add_friend_page.dart';
import 'package:flutter/material.dart';

class CustomConTactsToolbar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomConTactsToolbar({super.key});

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
              icon: const Icon(Icons.person_add,
                  color: Color.fromARGB(255, 255, 255, 255)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddFriendPage(),
                  ),
                );
              },
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
