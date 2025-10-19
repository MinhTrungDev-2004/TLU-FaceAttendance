import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/routes/web_routes.dart';

class LecturerBottomNav extends StatelessWidget {
  final int currentIndex;

  const LecturerBottomNav({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF1675FF),
      unselectedItemColor: Colors.black54,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamedAndRemoveUntil(
              context,
              WebRoutes.lecturer,
              (route) => false,
            );
            break;
          case 1:
            Navigator.pushNamedAndRemoveUntil(
              context,
              WebRoutes.scheduleLecturer,
              (route) => false,
            );
            break;
          case 2:
            Navigator.pushNamedAndRemoveUntil(
              context,
              WebRoutes.attendanceLecturer,
              (route) => false,
            );
            break;
          case 3:
            Navigator.pushNamedAndRemoveUntil(
              context,
              WebRoutes.reportLecturer,
              (route) => false,
            );
            break;
          case 4:
            Navigator.pushNamedAndRemoveUntil(
              context,
              WebRoutes.profileLecturer,
              (route) => false,
            );
            break;
        }
      },
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
