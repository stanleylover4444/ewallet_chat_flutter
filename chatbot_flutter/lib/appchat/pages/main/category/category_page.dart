import 'package:chatbot_flutter/appchat/widgets/toolbar_catory.dart';
import 'package:chatbot_flutter/ewallet/pages/home/home_page_wallet.dart';
import 'package:flutter/material.dart';
 

class CategoryPageNavigation extends StatelessWidget {
  const CategoryPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCatoryToolbar(),
      body: Center(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePageWallet(),
              ),
            );
          },
          child: const Text(
            "Ví điện tử",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
