
import 'package:flutter/material.dart';
import 'package:chatbot_flutter/appchat/widgets/appbar/toolbar_contacts.dart';
import 'package:chatbot_flutter/appchat/pages/main/contacts/friend_page.dart';
import 'package:chatbot_flutter/appchat/pages/main/contacts/group_page.dart';

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
              color: const Color.fromARGB(255, 241, 241, 241),
              child: const TabBar(
                
                labelColor: const Color.fromARGB(255, 0, 0, 0),
                unselectedLabelColor: Color.fromARGB(135, 94, 94, 94),
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
