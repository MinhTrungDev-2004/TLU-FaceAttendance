import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/features/auth/presentation/pages/login_page.dart';
import 'package:tlu_face_attendance/features/auth/presentation/pages/register_page.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/pages/home_page.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/pages/schedule_page.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/pages/attendance_page.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/pages/report_page.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/pages/profile_page.dart';

import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // Auth
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

    // Lecturer
      case AppRoutes.lecturer:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.scheduleLecturer:
        return MaterialPageRoute(builder: (_) => const SchedulePage());
      case AppRoutes.attendanceLecturer:
        return MaterialPageRoute(builder: (_) => const AttendancePage());
      case AppRoutes.reportLecturer:
        return MaterialPageRoute(builder: (_) => const ReportPage());
      case AppRoutes.profileLecturer:
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route không tồn tại')),
          ),
        );
    }
  }
}
