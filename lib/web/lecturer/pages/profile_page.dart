import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/lecturer/widgets/bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1675FF),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 60, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  "Ngô Minh Trung",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "MSV: 2251172533",
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),

          // Danh sách
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildMenuItem(Icons.camera_alt_outlined, "Cập nhật khuôn mặt"),
                _buildMenuItem(Icons.person_outline, "Thông tin cá nhân"),
                _buildMenuItem(Icons.settings_outlined, "Cài đặt"),
                _buildMenuItem(Icons.help_outline, "Trợ giúp"),
                _buildMenuItem(Icons.feedback_outlined, "Phản hồi / Góp ý"),
                _buildMenuItem(Icons.logout, "Đăng xuất"),
              ],
            ),
          ),
        ],
      ),
      // Nav
      bottomNavigationBar: const LecturerBottomNav(
        currentIndex: 4,
      ),
    );
  }


  Widget _buildMenuItem(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        const Divider(height: 1),
      ],
    );
  }
}
