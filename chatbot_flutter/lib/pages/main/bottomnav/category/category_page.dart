import 'package:chatbot_flutter/widget/toolbar_catory.dart';
import 'package:flutter/material.dart';

class CategoryPageNavigation extends StatelessWidget {
  const CategoryPageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomCatoryToolbar(),
      body: const Center(
        child: Text("danh mục"),
      ),
    );
  }
}

