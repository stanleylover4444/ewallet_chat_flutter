// ignore: file_names
import 'package:chatbot_flutter/widget/toolbar_social.dart';
import 'package:flutter/material.dart';

class SocialPageNavigation  extends StatelessWidget {
  const SocialPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: CustomSocialToolbar(),
      body: const Center(
        child: Text("socaial"),
      ),
    );
  }
}
