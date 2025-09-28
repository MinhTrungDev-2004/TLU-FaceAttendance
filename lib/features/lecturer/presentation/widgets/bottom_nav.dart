import 'package:flutter/material.dart';

class LecturerBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const LecturerBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF1675FF),
      unselectedItemColor: Colors.black54,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Trang chủ'),
        BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label: 'Lịch dạy'),
        BottomNavigationBarItem(icon: Icon(Icons.school_outlined), label: 'Điểm danh'),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Báo cáo'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Cá nhân'),
      ],
    );
  }
}
