import 'package:chatbot_flutter/pages/main/bottomnav/social/notification_page.dart';
import 'package:flutter/material.dart';

class CustomSocialToolbar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomSocialToolbar({super.key});

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
              icon: const Icon(Icons.notifications,
                  color: Color.fromARGB(255, 255, 255, 255)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
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
