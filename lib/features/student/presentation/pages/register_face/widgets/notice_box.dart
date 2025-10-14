import 'package:flutter/material.dart';

class NoticeBox extends StatelessWidget {
  const NoticeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.warning_amber_rounded, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  "Lưu ý",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("• Đảm bảo môi trường có ánh sáng tốt."),
            const Text("• Nhìn thẳng vào camera trong suốt quá trình."),
            const Text("• Không đeo kính râm, khẩu trang hoặc mũ."),
            const Text("• Giữ khuôn mặt trong khung hình."),
            const Text("• Quá trình sẽ mất khoảng 10 đến 15 giây."),
          ],
        ),
      ),
    );
  }
}
