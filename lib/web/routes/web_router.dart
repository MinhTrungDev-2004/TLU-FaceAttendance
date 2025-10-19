import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/core/auth/login_page.dart';
import 'package:tlu_face_attendance/core/auth/register_page.dart';
import 'package:tlu_face_attendance/web/lecturer/pages/home_page.dart';
import 'package:tlu_face_attendance/web/lecturer/pages/schedule_page.dart';
import 'package:tlu_face_attendance/web/lecturer/pages/attendance_page.dart';
import 'package:tlu_face_attendance/web/lecturer/pages/report_page.dart';
import 'package:tlu_face_attendance/web/lecturer/pages/profile_page.dart';
import 'web_routes.dart';

class WebRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // Auth
      case WebRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case WebRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

    // Lecturer
      case WebRoutes.lecturer:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case WebRoutes.scheduleLecturer:
        return MaterialPageRoute(builder: (_) => const SchedulePage());
      case WebRoutes.attendanceLecturer:
        return MaterialPageRoute(builder: (_) => const AttendancePage());
      case WebRoutes.reportLecturer:
        return MaterialPageRoute(builder: (_) => const ReportPage());
      case WebRoutes.profileLecturer:
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