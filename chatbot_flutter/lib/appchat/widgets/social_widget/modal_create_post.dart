import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ModalCreatePost extends StatefulWidget {
  const ModalCreatePost({super.key});

  @override
  _ModalCreatePostState createState() => _ModalCreatePostState();
}

class _ModalCreatePostState extends State<ModalCreatePost> {
  final TextEditingController _postController = TextEditingController();
  XFile? _selectedImage;
  XFile? _selectedVideo;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 58, 0, 0),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              "Tạo bài viết",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          actions: [
            Row(children: [
              OutlinedButton(
                onPressed: () {
                  _uploadPost();
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Đăng',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ]),
          ],
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: _buildCreatPostBody(),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildCreatPostFooter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatPostBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _postController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Bạn đang nghĩ gì?',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
          if (_selectedImage != null)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.file(
                File(_selectedImage!.path),
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          if (_selectedVideo != null)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Đã chọn video: ${_selectedVideo!.name}',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCreatPostFooter() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            SizedBox(width: 20),
            IconButton(
              onPressed: _pickImage,
              icon: Icon(Icons.photo, color: Colors.black),
            ),
            SizedBox(width: 17),
            IconButton(
              onPressed: _pickVideo,
              icon: Icon(Icons.video_camera_front, color: Colors.black),
            ),
            SizedBox(width: 17),
            IconButton(
              onPressed: () {
                // Xử lý gửi bài viết
              },
              icon: Icon(Icons.send, color: Colors.black, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
      _selectedVideo = null; // Đảm bảo chỉ chọn 1 loại tệp (ảnh hoặc video)
    });
  }

  Future<void> _pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      _selectedVideo = video;
      _selectedImage = null; // Đảm bảo chỉ chọn 1 loại tệp (ảnh hoặc video)
    });
  }

  void _uploadPost() {}
}
