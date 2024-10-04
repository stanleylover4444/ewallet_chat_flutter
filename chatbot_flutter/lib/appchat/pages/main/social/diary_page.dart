import 'package:flutter/material.dart';
import 'package:chatbot_flutter/appchat/widgets/addpost.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({Key? key, this.title = ''}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            AddPost(),
          ],
        ),
      ),
    );
  }
}
