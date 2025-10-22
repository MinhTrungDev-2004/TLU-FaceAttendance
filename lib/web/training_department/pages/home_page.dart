import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/routes/web_routes.dart';
import 'package:tlu_face_attendance/web/training_department/widgets/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideMenu(selectedRoute: WebRoutes.trainingDepartment),
          Expanded(
            child: Container(
              color: const Color(0xFFF4F7FC),
              padding: const EdgeInsets.all(30.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderBar(),
                  SizedBox(height: 20),
                  Text(
                    "Trang chủ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(child: DashboardGrid()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBar extends StatelessWidget {
  const _HeaderBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Thứ Năm, 01 tháng 1, 2025",
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("T", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ngô Minh Trung",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Phòng đào tạo",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// WIDGET 3: Thanh Tìm kiếm và Nút bấm (ĐÃ TRẢ LẠI NHƯ CŨ)
class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final tiles = [
      _DashboardTile('Quản lý khoa', Icons.business, WebRoutes.facultyManagement),
      _DashboardTile('Quản lý ngành', Icons.school, WebRoutes.majorManagement),
      _DashboardTile('Quản lý giảng viên', Icons.people, WebRoutes.lecturerManagement),
      _DashboardTile('Quản lý lớp học', Icons.book, WebRoutes.classManagement),
      _DashboardTile('Quản lý sinh viên', Icons.assignment, WebRoutes.studentManagement),
      _DashboardTile('Quản lý môn học', Icons.library_books, WebRoutes.subjectManagement),
      _DashboardTile('Quản lý phòng học', Icons.room, WebRoutes.roomManagement),
      _DashboardTile('Quản lý lịch giảng dạy', Icons.calendar_today, WebRoutes.scheduleTrainingDepartment),
      _DashboardTile('Quản lý điểm danh', Icons.check_circle, WebRoutes.attendanceManagement),
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 2,
      ),
      itemCount: tiles.length,
      itemBuilder: (context, index) {
        final t = tiles[index];
        return _DashboardCard(title: t.title, icon: t.icon, route: t.route);
      },
    );
  }
}

class _DashboardTile {
  final String title;
  final IconData icon;
  final String route;
  _DashboardTile(this.title, this.icon, this.route);
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  const _DashboardCard({required this.title, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.blue[800]!, width: 1),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 40),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}