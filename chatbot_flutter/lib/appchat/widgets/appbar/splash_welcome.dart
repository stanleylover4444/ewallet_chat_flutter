import 'package:chatbot_flutter/appchat/pages/login/introduce_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

class SplashWelcome extends StatefulWidget {
  const SplashWelcome({super.key});

  @override
  _SplashWelcomeState createState() => _SplashWelcomeState();
}

class _SplashWelcomeState extends State<SplashWelcome> {
  @override
  void initState() {
    super.initState();
 
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => const IntroducePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('images/5.json'),
          ],
        ),
      ),
    );
  }
}
