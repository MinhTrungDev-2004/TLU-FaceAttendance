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
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      // Giảng Viên
      case AppRoutes.lecturer:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.attendance:
        return MaterialPageRoute(builder: (_) => const AttendancePage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route không tồn tại')),
          ),
        );
    }
  }
}

