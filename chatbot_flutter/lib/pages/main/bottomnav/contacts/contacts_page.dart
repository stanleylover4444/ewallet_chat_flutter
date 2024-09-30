
import 'package:flutter/material.dart';
import 'package:chatbot_flutter/widget/toolbar_contacts.dart';
import 'package:chatbot_flutter/pages/main/bottomnav/contacts/friend_page.dart';
import 'package:chatbot_flutter/pages/main/bottomnav/contacts/group_page.dart';

class ContactsPageNavigation extends StatelessWidget {
  const ContactsPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomConTactsToolbar(),
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 232, 232, 232),
              child: const TabBar(
                labelColor: const Color.fromARGB(255, 0, 0, 0),
                unselectedLabelColor: const Color.fromARGB(137, 76, 76, 76),
                indicatorColor: const Color.fromARGB(255, 0, 0, 0),
                indicatorWeight: 4.0,
                tabs: [
                  Tab(
                    child: Text(
                      'Bạn bè',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Nhóm',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  FriendPage(),
                  GroupPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
