import 'package:chatbot_flutter/widget/toolbar_individual.dart';
import 'package:flutter/material.dart';

class IndividualPageNavigation extends StatelessWidget {
  const IndividualPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomIndividualToolbar(),
      body: const Center(
        child: Text("IndividualPageNavigation"),
      ),
    );
  }
}
