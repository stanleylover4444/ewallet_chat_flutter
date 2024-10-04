import 'dart:developer';
import 'package:chatbot_flutter/appchat/pages/login/login_pager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';

class PinCodeRegistePage extends StatefulWidget {
  const PinCodeRegistePage({super.key});

  @override
  State<PinCodeRegistePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodeRegistePage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final _otpFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      padding: EdgeInsets.all(5),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE0E0E0)), // Viền nhẹ
        borderRadius: BorderRadius.circular(10), // Bo góc
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5), // Nền sáng
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Xác Nhận PIN Mới',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Form(
            key: _otpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vui lòng nhập mã xác thực',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 20),
                Pinput(
                  controller: pinController,
                  length: 6,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  keyboardType: TextInputType.number,
                  onCompleted: (pin) {
                    log(pin);
                    // Thêm logic xử lý PIN đã nhập tại đây
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.blue),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border:
                          Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.red),
                  ),
                ),
                SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Đăng ký thành công!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPager(),
                      ),
                    );
                  },
                  child: const Text(
                    "Gửi",
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
                SizedBox(height: 20),
                Text(
                  'Chúng tôi sẽ gửi mã OTP đến điện thoại của bạn.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
