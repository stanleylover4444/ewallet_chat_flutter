
import 'package:chatbot_flutter/appchat/widgets/toolbar_individual.dart';
import 'package:chatbot_flutter/ewallet/pages/home/home_page_wallet.dart';
import 'package:flutter/material.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
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
        setState(() {
          _isSelectedList = [false, false, false];
        });
        break;
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
      appBar: CustomIndividualToolbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildItem("Cloud của tôi", Icons.cloud, 0),
            _buildItem("Tài khoản và bảo mật", Icons.shield, 1),
            _buildItem("Quyền riêng tư", Icons.lock, 2),
          ],
        ),
      ),
    );
  }
}
