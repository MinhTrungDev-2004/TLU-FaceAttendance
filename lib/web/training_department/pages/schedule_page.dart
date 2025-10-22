import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/routes/web_routes.dart';
import 'package:tlu_face_attendance/web/training_department/widgets/side_menu.dart';

// Đặt tên file là schedule_page.dart
class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String _selectedLecturer = "Thầy Kiều Tuấn Dũng";
  final List<String> _lecturers = ["Thầy Kiều Tuấn Dũng", "Thầy Hiếu TC", "Thầy Cù Việt Dũng"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideMenu(selectedRoute: WebRoutes.scheduleTrainingDepartment),
          Expanded(
            child: Container(
              color: const Color(0xFFF4F7FC),
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2.1. Thanh Header
                  const HeaderBar(),
                  const SizedBox(height: 20),

                  // 2.2. Tiêu đề trang
                  const Text(
                    "Quản lý lịch giảng dạy",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Text(
                    "Chào mừng bạn đến với trang quản lý lịch giảng dạy",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),

                  // 2.3. Thanh tìm kiếm, dropdown và nút bấm
                  ScheduleActionBar(
                    selectedLecturer: _selectedLecturer,
                    lecturers: _lecturers,
                    onLecturerChanged: (newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedLecturer = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),

                  // 2.4. Khu vực bảng dữ liệu
                  Expanded(
                    child: ScheduleDataSection(

                      lecturerName: _selectedLecturer,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Removed duplicate local SideMenu; using shared widget instead

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

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

// WIDGET 3: ScheduleActionBar (Widget MỚI)
class ScheduleActionBar extends StatelessWidget {
  final String selectedLecturer;
  final List<String> lecturers;
  final ValueChanged<String?> onLecturerChanged;

  const ScheduleActionBar({
    super.key,
    required this.selectedLecturer,
    required this.lecturers,
    required this.onLecturerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Thanh tìm kiếm
        SizedBox(
          width: 350,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Tìm kiếm theo môn học, phòng, giảng viên,...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          ),
        ),
        // Cụm Dropdown và Nút
        Row(
          children: [
            const Text(
              "Chọn giảng viên:",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(width: 10),
            // Dropdown chọn giảng viên
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedLecturer,
                  onChanged: onLecturerChanged,
                  items: lecturers.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(width: 20),
            // Nút "Thêm lịch giảng dạy"
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Thêm lịch giảng dạy"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// WIDGET 4: ScheduleDataSection (Widget MỚI)
class ScheduleDataSection extends StatelessWidget {
  final String lecturerName;
  const ScheduleDataSection({super.key, required this.lecturerName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề động
          Text(
            "Lịch giảng dạy của $lecturerName",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width - 360,
                ),
                child: const ScheduleDataTable(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Phân trang
          const PaginationControls(),
        ],
      ),
    );
  }
}

// WIDGET 5: ScheduleDataTable (Widget MỚI)
class ScheduleDataTable extends StatelessWidget {
  const ScheduleDataTable({super.key});

  Widget _buildActionButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> schedules = [
      {
        "stt": "1",
        "ngay": "24/08/2025",
        "start": "07:00:00",
        "end": "08:00:00",
        "mon": "Android",
        "lop": "64KTPM3",
        "phong": "302-C5"
      },
      {
        "stt": "2",
        "ngay": "25/08/2025",
        "start": "07:00:00",
        "end": "08:00:00",
        "mon": "Android",
        "lop": "64KTPM3",
        "phong": "302-C5"
      },
      {
        "stt": "4",
        "ngay": "27/08/2025",
        "start": "07:00:00",
        "end": "08:00:00",
        "mon": "Android",
        "lop": "64KTPM3",
        "phong": "302-C5"
      },
      {
        "stt": "5",
        "ngay": "29/08/2025",
        "start": "07:00:00",
        "end": "08:00:00",
        "mon": "Android",
        "lop": "64KTPM3",
        "phong": "302-C5"
      },
      {
        "stt": "6",
        "ngay": "31/08/2025",
        "start": "07:00:00",
        "end": "08:00:00",
        "mon": "Android",
        "lop": "64KTPM3",
        "phong": "302-C5"
      },
    ];

    return DataTable(
      headingRowColor: MaterialStateProperty.all(Colors.grey[100]),
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      columns: const <DataColumn>[
        DataColumn(label: Text("STT")),
        DataColumn(label: Text("Ngày học")),
        DataColumn(label: Text("Thời gian bắt đầu")),
        DataColumn(label: Text("Thời gian kết thúc")),
        DataColumn(label: Text("Môn học")),
        DataColumn(label: Text("Lớp học")),
        DataColumn(label: Text("Phòng học")),
        DataColumn(label: Text("#")),
      ],
      rows: schedules.map((schedule) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(schedule["stt"]!)),
            DataCell(Text(schedule["ngay"]!)),
            DataCell(Text(schedule["start"]!)),
            DataCell(Text(schedule["end"]!)),
            DataCell(Text(schedule["mon"]!)),
            DataCell(Text(schedule["lop"]!)),
            DataCell(Text(schedule["phong"]!)),
            DataCell(Row(
              children: [
                _buildActionButton(
                  text: "Xem",
                  color: const Color(0xFF26A69A),
                  onPressed: () {},
                ),
                _buildActionButton(
                  text: "Sửa",
                  color: const Color(0xFF4CAF50),
                  onPressed: () {},
                ),
                _buildActionButton(
                  text: "Xóa",
                  color: const Color(0xFFE53935),
                  onPressed: () {},
                ),
              ],
            )),
          ],
        );
      }).toList(),
    );
  }
}

// WIDGET 6: PaginationControls (Tái sử dụng)
class PaginationControls extends StatelessWidget {
  const PaginationControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hiển thị 1 - 5 của 100 lịch giảng dạy",
          style: TextStyle(color: Colors.grey[600]),
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text("Trước")),
            _buildPaginationButton("1", isSelected: true),
            _buildPaginationButton("2"),
            _buildPaginationButton("3"),
            TextButton(onPressed: () {}, child: const Text("Tiếp >")),
          ],
        ),
      ],
    );
  }

  Widget _buildPaginationButton(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          minimumSize: const Size(40, 40),
          backgroundColor: isSelected ? Colors.blue[700] : Colors.grey[200],
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}