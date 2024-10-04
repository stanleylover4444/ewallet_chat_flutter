import 'package:chatbot_flutter/appchat/widgets/toolbar_social.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSocialToolbar(),
      // body:  HomeScreen()
    );
  }
}
