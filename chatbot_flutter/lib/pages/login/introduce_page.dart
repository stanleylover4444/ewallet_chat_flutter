import 'package:chatbot_flutter/pages/login/welcome_pager.dart';
import 'package:flutter/material.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/images/1.png',
                width: 100,
                height: 400,
              ),
            ),
            // Văn bản chào mừng
            const Text(
              "Unlock the Power",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            const Text(
              "Of Future AI",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Khám phá các tính năng mới của chúng tôi.",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, 0.702),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const WelcomePager()),
                  );
                },
                child: const Text("Tiếp tục"))
          ],
        ),
      ),
    );
  }
}
