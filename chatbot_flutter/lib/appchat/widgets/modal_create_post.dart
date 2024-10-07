import 'package:flutter/material.dart';

class ModalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white), 
                onPressed: () => Navigator.pop(context),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: const [
                  Text(
                    'Tạo bài viết',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                OutlinedButton(
                  
                  onPressed: () {
                 
                  },
                  child: const Text(
                    'Đăng',
                    style: TextStyle(color: Colors.white), 
                  ),
                ),
                SizedBox(width: 10)
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Nội dung modal ở đây',
                style: TextStyle(color: Colors.black), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
