import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homecard extends StatelessWidget {
  const Homecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          Lottie.asset('assets/lotties/13.json', width: 100 , height: 100)
        ],
      ),
    );
  }
}
