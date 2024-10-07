import 'package:chatbot_flutter/appchat/widgets/modal_create_post.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const AddPostPage(); // Không cần truyền showModal nữa
  }
}

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPostPage> {
  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
          ),
          child: SafeArea(
            child: ModalContent(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: const Color(0xFF1777F2),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          "https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _showModal(context), // Gọi _showModal
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'What\'s on your mind?',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 20.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => print('Live'),
                    icon: const Icon(
                      Icons.abc_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                    label: const Text('Live'),
                  ),
                  const VerticalDivider(width: 8.0),
                  OutlinedButton.icon(
                    onPressed: () => print('Photo'),
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.lightGreen,
                      size: 20,
                    ),
                    label: const Text('Photo'),
                  ),
                  const VerticalDivider(width: 8.0),
                  OutlinedButton.icon(
                    onPressed: () => print('Room'),
                    icon: const Icon(
                      Icons.video_call,
                      color: Color.fromARGB(255, 57, 44, 93),
                      size: 20,
                    ),
                    label: const Text('Room'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
