import 'package:chatbot_flutter/appchat/model/user_model.dart';
import 'package:chatbot_flutter/appchat/widgets/social_widget/profile_avatar.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => _onLivePressed(context),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text('Live'),
                ),
                const VerticalDivider(width: 8.0),
                TextButton.icon(
                  onPressed: () => _onPhotoPressed(context),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text('Photo'),
                ),
                const VerticalDivider(width: 8.0),
                TextButton.icon(
                  onPressed: () => _onRoomPressed(context),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: const Text('Room'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onLivePressed(BuildContext context) {
    // Add your live action here
  }

  void _onPhotoPressed(BuildContext context) {
    // Add your photo action here
  }

  void _onRoomPressed(BuildContext context) {
    // Add your room action here
  }
}
