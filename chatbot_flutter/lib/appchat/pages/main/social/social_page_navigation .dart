import 'package:chatbot_flutter/appchat/widgets/addpost.dart';
import 'package:chatbot_flutter/appchat/widgets/appbar/toolbar_social.dart';

import 'package:flutter/material.dart';

class SocialPageNavigation extends StatelessWidget {
  const SocialPageNavigation({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSocialToolbar(),
      body: AddPost(),
    );
  }
}

