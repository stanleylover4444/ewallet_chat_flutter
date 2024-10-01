import 'package:chatbot_flutter/pages/register/pin_code_page.dart';
import 'package:chatbot_flutter/widgets/splash_welcome.dart';
// import 'package:chatbot_flutter/widgets/splash_welcome.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
    );
  }
}
