import 'package:flutter/material.dart';

class FriendRequestPage extends StatelessWidget {
  const FriendRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
          title: Row(
            children: [
              Text(
                "Lời mời kết bạn",
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 16, 
                  fontWeight: FontWeight.bold, 
                  fontFamily:
                      'Roboto', 
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black, // Màu nền của AppBar
        ),
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 241, 241, 241),
              child: const TabBar(
                labelColor: Color.fromARGB(255, 0, 0, 0),
                unselectedLabelColor: Color.fromARGB(135, 94, 94, 94),
                indicatorColor: Color.fromARGB(255, 0, 0, 0),
                indicatorWeight: 4.0,
                tabs: [
                  Tab(
                    child: Text(
                      'Đã nhận',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Đã gửi',
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
                  // FriendPage(),
                  // GroupPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
