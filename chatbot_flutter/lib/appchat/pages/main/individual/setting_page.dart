import 'package:chatbot_flutter/appchat/widgets/toolbar_individual.dart';
import 'package:chatbot_flutter/ewallet/pages/home/home_page_wallet.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<bool> _isSelectedList = [false, false, false];

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
          MaterialPageRoute(builder: (context) => HomePageWallet()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                "Cài đặt",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildItem("Tài khoản và bảo mật", Icons.cloud, 0),
            _buildItem("Quyền riêng tư", Icons.shield, 1),
            _buildItem("Thông báo", Icons.notifications, 2),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: OutlinedButton(
                onPressed: _showLogoutConfirmation, // Gọi BottomSheet
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.door_front_door,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Đăng xuất",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmation() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Đăng xuất khỏi tài khoản này ?",
                style: TextStyle(fontSize: 16 ,color: Colors.black  ,  fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: OutlinedButton(
                  onPressed: (){

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 8),
                      Text(
                        "Đăng xuất",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    backgroundColor:
                        const Color.fromARGB(255, 255, 0, 0).withOpacity(0.2),
                    side: BorderSide(
                      color: Colors.white
                    ),
                  ),
                ),
                
              ),
              SizedBox(height: 30,)
            ],
          ),
        );
      },
    );
  }
}
