import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/routes/web_routes.dart';

class SideMenu extends StatelessWidget {
  final String selectedRoute;

  const SideMenu({super.key, required this.selectedRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: const Color(0xFF003366),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "TRƯỜNG ĐẠI HỌC THỦY LỢI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "HỆ THỐNG ĐIỂM DANH",
                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white24, height: 1),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(context, Icons.home, "Trang chủ", WebRoutes.trainingDepartment),
                _buildMenuItem(context, Icons.business, "Quản lý khoa", WebRoutes.facultyManagement),
                _buildMenuItem(context, Icons.school, "Quản lý ngành", WebRoutes.majorManagement),
                _buildMenuItem(context, Icons.people, "Quản lý giảng viên", WebRoutes.lecturerManagement),
                _buildMenuItem(context, Icons.book, "Quản lý lớp học", WebRoutes.classManagement),
                _buildMenuItem(context, Icons.assignment, "Quản lý sinh viên", WebRoutes.studentManagement),
                _buildMenuItem(context, Icons.library_books, "Quản lý môn học", WebRoutes.subjectManagement),
                _buildMenuItem(context, Icons.room, "Quản lý phòng học", WebRoutes.roomManagement),
                _buildMenuItem(context, Icons.calendar_today, "Quản lý lịch giảng dạy", WebRoutes.scheduleTrainingDepartment),
                _buildMenuItem(context, Icons.check_circle, "Quản lý điểm danh", WebRoutes.attendanceManagement),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String route) {
    final bool isSelected = selectedRoute == route;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[700] : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () {
          if (!isSelected) {
            Navigator.pushNamed(context, route);
          }
        },
      ),
    );
  }
}


