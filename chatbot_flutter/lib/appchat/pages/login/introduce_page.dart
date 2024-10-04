import 'package:chatbot_flutter/appchat/pages/login/welcome_pager.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách hình ảnh để hiển thị trong carousel
    final List<String> imgList = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              // Sử dụng CarouselSlider
              CarouselSlider(
                options: CarouselOptions(
                  height: 400.0, // Chiều cao của carousel
                  autoPlay: true, // Tự động chạy
                  enlargeCenterPage: true, // Phóng to hình giữa
                ),
                items: imgList
                    .map((item) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(item, fit: BoxFit.cover),
                        ))
                    .toList(),
              ),

              const SizedBox(height: 20),
              // Văn bản chào mừng
              const Text(
                "Unlock the Power",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              const Text(
                "Of Future AI",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Khám phá các tính năng mới của chúng tôi.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(0, 0, 0, 0.702),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WelcomePager(),
                      ),
                    );
                  },
                  child: const Text(
                    "Tiếp tục",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
