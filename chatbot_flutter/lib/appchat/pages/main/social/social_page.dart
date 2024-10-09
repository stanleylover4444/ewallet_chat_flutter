
import 'package:chatbot_flutter/appchat/widgets/appbar/toolbar_social.dart';

import 'package:chatbot_flutter/appchat/widgets/social_widget/create_post_container.dart';
import 'package:chatbot_flutter/appchat/widgets/social_widget/stories.dart';
import 'package:chatbot_flutter/appchat/widgets/social_widget/post_container.dart';

import 'package:chatbot_flutter/data/data.dart';
import 'package:flutter/material.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomSocialToolbar(),
        body: ListView(
          controller: _scrollController,
          children: [
             const SizedBox(height: 10.0),
            CreatePostContainer(currentUser: currentUser),
            const SizedBox(height: 10.0),
            Stories(currentUser: currentUser, stories: stories),
            const SizedBox(height: 10.0),
            ...posts.map((post) => PostContainer(post: post)).toList(),
          ],
        ),
      ),
    );
  }
}
