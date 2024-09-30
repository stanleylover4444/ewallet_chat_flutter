import 'package:chatbot_flutter/pages/main/bottomnav/contacts/friend_page.dart';
import 'package:flutter/material.dart';
import 'package:chatbot_flutter/widget/toolbar_contacts.dart';

import 'group_page.dart';

class ContactsPageNavigation extends StatelessWidget {
  const ContactsPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: CustomConTactsToolbar(),
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Bạn bè'),
                Tab(text: 'Nhóm'),
              ],
            ),
            Expanded(
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
