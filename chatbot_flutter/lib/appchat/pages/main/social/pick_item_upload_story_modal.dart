import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class PickItemUploadStory extends StatefulWidget {
  const PickItemUploadStory({super.key});

  @override
  _PickItemUploadStoryState createState() => _PickItemUploadStoryState();
}

class _PickItemUploadStoryState extends State<PickItemUploadStory> {
  List<AssetEntity> mediaList = []; // Lưu trữ danh sách ảnh và video

  @override
  void initState() {
    super.initState();
    _loadMedia(); // Gọi hàm lấy phương tiện
  }

  // Hàm để tải toàn bộ ảnh và video từ điện thoại
  Future<void> _loadMedia() async {
    final permitted =
        await PhotoManager.requestPermissionExtend(); // Yêu cầu quyền truy cập
    if (permitted.isAuth) {
      // Lấy tất cả phương tiện từ thiết bị
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.common, // Lấy cả ảnh và video
        hasAll: true,
      );

      // Chỉ lấy album chính "Recents"
      final recentAlbum = albums.first;

      // Lấy các phương tiện trong album
      List<AssetEntity> media =
          await recentAlbum.getAssetListPaged(page: 0, size: 100);

      setState(() {
        mediaList = media;
      });
    } else {
      // Nếu không có quyền truy cập
      PhotoManager.openSetting();
    }
  }

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
            title: Text(
              "Tạo tin",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: mediaList.isEmpty
              ? Center(
                  child:
                      CircularProgressIndicator(), // Hiển thị loading khi chưa tải xong
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Hiển thị 3 cột
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: mediaList.length,
                  itemBuilder: (context, index) {
                    final media = mediaList[index];
                    return FutureBuilder<Uint8List?>(
                      future: media.thumbnailDataWithSize(
                          ThumbnailSize(200, 200),
                          quality: 100),
                      builder: (context, snapshot) {
                        final bytes = snapshot.data;
                        if (bytes == null) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return GestureDetector(
                          onTap: () {
                            // Thêm sự kiện khi người dùng nhấn vào ảnh/video
                            print("Chọn phương tiện: ${media.id}");
                          },
                          child: Image.memory(
                            bytes,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  },
                ),
        ));
  }
}
