import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            // Avatar và tên
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lê Đức Chiến',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),

            // Các mục menu
            _buildMenuItem(Icons.camera_alt_outlined, 'Cập nhật khuôn mặt'),
            _buildMenuItem(Icons.person_outline, 'Thông tin cá nhân'),
            _buildMenuItem(Icons.settings_outlined, 'Cài đặt'),
            _buildMenuItem(Icons.help_outline, 'Trợ giúp'),
            _buildMenuItem(Icons.feedback_outlined, 'Phản hồi / Góp ý'),
            _buildMenuItem(Icons.logout, 'Đăng xuất'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
