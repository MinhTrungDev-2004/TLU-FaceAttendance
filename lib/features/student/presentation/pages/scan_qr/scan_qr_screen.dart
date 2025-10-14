import 'dart:async';
import 'package:flutter/material.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  bool _isScanning = true;
  String _statusText = 'Đưa mã QR vào khung để quét...';

  @override
  void initState() {
    super.initState();

    // Giả lập camera quét QR
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isScanning = false;
        _statusText = '✅ Quét thành công!';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = 100;
    final double appBarWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size(appBarWidth, appBarHeight),
        child: Container(
          height: appBarHeight,
          decoration: const BoxDecoration(
            color: Color(0xFF1470E2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'QR code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          // Khung camera mô phỏng
          Center(
            child: Container(
              width: 309,
              height: 450,
              decoration: BoxDecoration(
                color: Colors.black,
                
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Khung viền xanh
                  Container(
                    width: 220,
                    height: 249,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.greenAccent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  // Icon mô phỏng
                  if (_isScanning)
                    const Icon(Icons.qr_code_2,
                        color: Colors.white38, size: 100)
                  else
                    const Icon(Icons.check_circle,
                        color: Colors.green, size: 80),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
          Text(
            _statusText,
            style: TextStyle(
              color: _isScanning ? Colors.black54 : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          // Nút Hủy
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Hủy',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
