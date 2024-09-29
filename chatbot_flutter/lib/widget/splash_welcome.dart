// import 'package:chatbot_flutter/pages/login/welcome_page.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';

// class SplashScreen extends StatefulWidget {
//    const SplashScreen({super.key});
  
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const WelcomePage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("thdanh"),
//             SizedBox(height: 20),
//             CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }