import 'package:flutter/material.dart';

void main() {
  runApp(AddPost());
}

class AddPost extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AddPostPage();
  }
}

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key, this.title = ''}) : super(key: key);

  final String title;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPostPage> {
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
                      backgroundColor: Color(0xFF1777F2),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                            "https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                )
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
                    label: Text('Live'),
                  ),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  OutlinedButton.icon(
                    onPressed: () => print('Photo'),
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.lightGreen,
                      size: 20,
                    ),
                    label: Text('Photo'),
                  ),
                  const VerticalDivider(width: 8.0),
                  OutlinedButton.icon(
                    onPressed: () => print('Room'),
                    icon: const Icon(
                      Icons.video_call,
                      color: Color.fromARGB(255, 57, 44, 93),
                      size: 20,
                    ),
                    label: Text('Room'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
