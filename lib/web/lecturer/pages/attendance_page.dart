import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/lecturer/widgets/header_lecturer.dart';
import 'package:tlu_face_attendance/web/lecturer/widgets/bottom_nav.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String filter = "Tất cả";

  final List<Map<String, String>> students = [
    {"name": "Ngô Minh Trung", "id": "01"},
    {"name": "Nguyễn Ngọc Phước", "id": "02"},
    {"name": "Lê Đức Chiến", "id": "03"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            const HeaderLecturer(title: "Điểm danh"),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nút bắt đầu điểm danh
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text("Bắt đầu điểm danh"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF349AFF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Thống kê tham dự
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.group, color: Colors.blue),
                              SizedBox(width: 8),
                              Text(
                                "Thống kê tham dự",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              _StatItem(label: "Tổng số", value: "8", color: Colors.blue),
                              _StatItem(label: "Có mặt", value: "3", color: Colors.green),
                              _StatItem(label: "Muộn", value: "5", color: Colors.orange),
                              _StatItem(label: "Vắng", value: "0", color: Colors.red),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text("Tỉ lệ tham dự"),
                          const SizedBox(height: 6),
                          LinearProgressIndicator(
                            value: 3 / 8,
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          const SizedBox(height: 4),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text("36%"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tìm kiếm sinh viên
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Tìm kiếm sinh viên",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Bộ lọc
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _FilterButton(
                        label: "Tất cả (8)",
                        isActive: filter == "Tất cả",
                        color: Colors.blue,
                        onTap: () => setState(() => filter = "Tất cả"),
                      ),
                      _FilterButton(
                        label: "Có mặt (3)",
                        isActive: filter == "Có mặt",
                        color: Colors.green,
                        onTap: () => setState(() => filter = "Có mặt"),
                      ),
                      _FilterButton(
                        label: "Muộn (2)",
                        isActive: filter == "Muộn",
                        color: Colors.orange,
                        onTap: () => setState(() => filter = "Muộn"),
                      ),
                      _FilterButton(
                        label: "Vắng (5)",
                        isActive: filter == "Vắng",
                        color: Colors.red,
                        onTap: () => setState(() => filter = "Vắng"),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Danh sách sinh viên
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Danh sách sinh viên",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: students.length,
                            itemBuilder: (context, index) {
                              final student = students[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  title: Text(student["name"]!),
                                  subtitle: Text("MSV: ${student["id"]}"),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF349AFF),
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      // logic điểm danh
                                    },
                                    child: const Text(
                                      "Điểm danh",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Nav
      bottomNavigationBar: const LecturerBottomNav(
        currentIndex: 2,
      ),
    );
  }
}

// Thống kê
class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey[700], fontSize: 14),
        ),
      ],
    );
  }
}

// Widget nút lọc
class _FilterButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final Color color;

  const _FilterButton({
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isActive ? color : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
