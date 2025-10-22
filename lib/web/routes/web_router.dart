import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/core/auth/login_page.dart';
import 'package:tlu_face_attendance/core/auth/register_page.dart';
import 'package:tlu_face_attendance/web/lecturer/pages/home_page.dart' as lecturer;
import 'package:tlu_face_attendance/web/lecturer/pages/schedule_page.dart' as lecturer_schedule;
import 'package:tlu_face_attendance/web/lecturer/pages/attendance_page.dart';
import 'package:tlu_face_attendance/web/lecturer/pages/report_page.dart';
import 'package:tlu_face_attendance/web/lecturer/pages/profile_page.dart';
import 'package:tlu_face_attendance/web/training_department/pages/home_page.dart' as training;
import 'package:tlu_face_attendance/web/training_department/pages/schedule_page.dart' as training_schedule;
import 'package:tlu_face_attendance/web/training_department/pages/major_page.dart' as training_major;
import 'package:tlu_face_attendance/web/training_department/pages/lecturer_page.dart' as training_lecturer;
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
        return MaterialPageRoute(builder: (_) => const lecturer.HomePage());
      case WebRoutes.scheduleLecturer:
        return MaterialPageRoute(builder: (_) => const lecturer_schedule.SchedulePage());
      case WebRoutes.attendanceLecturer:
        return MaterialPageRoute(builder: (_) => const AttendancePage());
      case WebRoutes.reportLecturer:
        return MaterialPageRoute(builder: (_) => const ReportPage());
      case WebRoutes.profileLecturer:
        return MaterialPageRoute(builder: (_) => const ProfilePage());

    // Training Department
      case WebRoutes.trainingDepartment:
        return MaterialPageRoute(builder: (_) => const training.HomePage());
      case WebRoutes.scheduleTrainingDepartment:
        return MaterialPageRoute(builder: (_) => const training_schedule.SchedulePage());
      // case WebRoutes.facultyManagement:
      //   return MaterialPageRoute(builder: (_) => const training_faculty.FacultyPage());
      case WebRoutes.majorManagement:
        return MaterialPageRoute(builder: (_) => const training_major.MajorPage());
      case WebRoutes.lecturerManagement:
        return MaterialPageRoute(builder: (_) => const training_lecturer.LecturerPage());
      case WebRoutes.classManagement:
        return MaterialPageRoute(builder: (_) => _buildPlaceholderPage("Quản lý lớp học"));
      case WebRoutes.studentManagement:
        return MaterialPageRoute(builder: (_) => _buildPlaceholderPage("Quản lý sinh viên"));
      case WebRoutes.subjectManagement:
        return MaterialPageRoute(builder: (_) => _buildPlaceholderPage("Quản lý môn học"));
      case WebRoutes.roomManagement:
        return MaterialPageRoute(builder: (_) => _buildPlaceholderPage("Quản lý phòng học"));
      case WebRoutes.attendanceManagement:
        return MaterialPageRoute(builder: (_) => _buildPlaceholderPage("Quản lý điểm danh"));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route không tồn tại')),
          ),
        );
    }
  }

  // Helper method để tạo trang placeholder
  static Widget _buildPlaceholderPage(String title) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF003366),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Trang này đang được phát triển",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Có thể thêm logic quay lại trang trước
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003366),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text("Quay lại"),
            ),
          ],
        ),
      ),
    );
  }
}
