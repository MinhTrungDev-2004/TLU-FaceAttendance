import 'package:flutter/material.dart';
import '../face_camera_screen.dart';

class FaceCard extends StatelessWidget {
  final VoidCallback? onStart;

  const FaceCard({super.key, this.onStart});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    // Tối ưu kích thước cho Samsung Galaxy Note 5
    final double cardPadding = screenWidth * 0.06; // 6% chiều rộng màn hình
    final double iconSize = screenWidth * 0.08; // 8% chiều rộng màn hình
    final double avatarSize = screenWidth * 0.25; // 25% chiều rộng màn hình
    final double buttonHeight = screenHeight * 0.06; // 6% chiều cao màn hình
    final double fontSize = screenWidth * 0.04; // 4% chiều rộng màn hình
    final double titleFontSize = screenWidth * 0.045; // 4.5% chiều rộng màn hình

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_box_outlined, 
                  color: Colors.black, 
                  size: iconSize,
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: Text(
                    "Thiết lập nhận diện khuôn mặt",
                    style: TextStyle(
                      fontSize: titleFontSize, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(avatarSize / 2),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.camera_alt, 
                color: Colors.grey.shade500, 
                size: avatarSize * 0.4,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              "Chúng tôi sẽ chụp một vài bức ảnh để thiết lập đăng ký khuôn mặt cho tài khoản của bạn",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600, 
                fontSize: fontSize,
                height: 1.4,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton.icon(
              onPressed: () async {
                if (onStart != null) {
                  onStart!();
                  return;
                }

                // Default behaviour: navigate to the simulated camera screen and wait for result.
                final result = await Navigator.of(context).push<bool>(
                  MaterialPageRoute(
                    builder: (_) => FaceCameraScreen(
                      cameras: const [],
                      onFaceCaptured: (_) {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ),
                );

                if (result == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đăng ký khuôn mặt hoàn tất (mô phỏng)")),
                  );
                }
              },
              icon: Icon(
                Icons.camera_alt, 
                color: Colors.white,
                size: iconSize * 0.7,
              ),
              label: Text(
                "Bắt đầu", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1470E2),
                minimumSize: Size(double.infinity, buttonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
