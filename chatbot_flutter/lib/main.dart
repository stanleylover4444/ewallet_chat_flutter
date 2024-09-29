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
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("sse"), // Thêm tiêu đề AppBar
          ),
        
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
