import 'package:chatbot_flutter/widget/toolbar_contacts.dart';
import 'package:flutter/material.dart';

class ContactsPageNavigation extends StatelessWidget {
  const ContactsPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomConTactsToolbar(), 
      body: const Center(
        child: Text("Danh bạ"),
      ),
    );
  }
}
