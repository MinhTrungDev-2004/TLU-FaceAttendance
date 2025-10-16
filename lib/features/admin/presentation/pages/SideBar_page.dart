import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF0D47A1);

class Sidebar extends StatelessWidget {
  final Function(int) onItemSelected;

  const Sidebar({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: primaryColor,
      child: Column(
        children: [
          // 🏫 Header có logo và tên trường
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png', // Đường dẫn tới logo
                  height: 70,
                  width: 70,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),
                const Text(
                  'TRƯỜNG ĐẠI HỌC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'THỦY LỢI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Danh sách menu
          SidebarItem(
            title: "Trang chủ",
            icon: Icons.home,
            onTap: () => onItemSelected(0),
          ),
          SidebarItem(
            title: "Quản lý Giảng viên",
            icon: Icons.group,
            onTap: () => onItemSelected(1),
          ),

          const Spacer(),

          // 🔻 Footer
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              '© 2025 Đại học Thủy Lợi',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SidebarItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white70, fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
