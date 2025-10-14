import 'package:flutter/material.dart';
import '../face_camera_screen.dart';

class FaceCard extends StatelessWidget {
  final VoidCallback? onStart;

  const FaceCard({super.key, this.onStart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: const [
                Icon(Icons.account_box_outlined, color: Colors.black, size: 28),
                SizedBox(width: 8),
                Text(
                  "Thiết lập nhận diện khuôn mặt",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.camera_alt, color: Colors.grey, size: 40),
            ),
            const SizedBox(height: 12),
            Text(
              "Chúng tôi sẽ chụp một vài bức ảnh để thiết lập đăng ký khuôn mặt cho tài khoản của bạn",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () async {
                if (onStart != null) {
                  onStart!();
                  return;
                }

                // Default behaviour: navigate to the simulated camera screen and wait for result.
                final result = await Navigator.of(context).push<bool>(
                  MaterialPageRoute(builder: (_) => const FaceCameraScreen()),
                );

                if (result == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đăng ký khuôn mặt hoàn tất (mô phỏng)")),
                  );
                }
              },
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              label: const Text("Bắt đầu", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1470E2),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
