import 'package:flutter/material.dart';
import 'widgets/face_card.dart';
import 'widgets/notice_box.dart';

class RegisterFaceScreen extends StatelessWidget {
  const RegisterFaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = 104;
    final double appBarWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(appBarWidth, appBarHeight),
        child: Container(
          width: appBarWidth,
          height: appBarHeight,
          decoration: const BoxDecoration(
            color: Color(0xFF1470E2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                // --- Nút quay lại ---
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),

                // --- Tiêu đề ngang hàng với nút ---
                const Text(
                  'Đăng ký khuôn mặt',
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

      // --- Nội dung thân trang ---
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            FaceCard(),
            SizedBox(height: 16),
            NoticeBox(),
          ],
        ),
      ),
    );
  }
}
