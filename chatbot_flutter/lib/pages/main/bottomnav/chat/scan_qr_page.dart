import 'package:chatbot_flutter/pages/main/bottomnav/chat/result_page.dart';
import 'package:chatbot_flutter/widget/qr_scanner_overlay.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({Key? key}) : super(key: key);

  @override
  State<ScanQrPage> createState() => _ScannerState();
}

class _ScannerState extends State<ScanQrPage> {
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  void initState() {
    super.initState();
    _screenWasClosed(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: _foundBarcode, 
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
        ],
      ),
    );
  }

  void _foundBarcode(BarcodeCapture barcodeCapture) {
    if (!_screenOpened) {
      final String code = barcodeCapture.barcodes.first.rawValue ?? "___"; 
      _screenOpened = true; 

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoundScreen(
            value: code,
            screenClose: _screenWasClosed,
          ),
        ),
      ).then((value) {
        _screenWasClosed(); 
      });
    }
  }

  void _screenWasClosed() {
    setState(() {
      _screenOpened = false;
    });
  }
}
