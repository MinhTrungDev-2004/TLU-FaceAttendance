import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/routes/web_routes.dart';
import 'package:tlu_face_attendance/web/training_department/widgets/side_menu.dart';

class LecturerPage extends StatefulWidget {
  const LecturerPage({super.key});
  @override
  State<LecturerPage> createState() => _LecturerPageState();
}

class _LecturerPageState extends State<LecturerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideMenu(selectedRoute: WebRoutes.lecturerManagement),
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
                    "Quản lý giảng viên",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Quản lý thông tin các giảng viên trong Trường Đại Học Thủy Lợi",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),
                  _ActionBar(),
                  SizedBox(height: 20),
                  Expanded(
                    child: _LecturerDataSection(),
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

class _ActionBar extends StatelessWidget {
  const _ActionBar();

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
              hintText: "Nhập tên giảng viên",
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
        // Nút "Thêm giảng viên" (Giữ nguyên)
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("Thêm giảng viên"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

class _LecturerDataSection extends StatelessWidget {
  const _LecturerDataSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề "Danh sách giảng viên"
          Text(
            "Danh sách giảng viên",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),

          // Bảng dữ liệu
          Expanded(
            child: _LecturerDataTable(),
          ),

          SizedBox(height: 20),
          // Phân trang
          _PaginationControls(),
        ],
      ),
    );
  }
}

class _LecturerDataTable extends StatelessWidget {
  const _LecturerDataTable();

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
    final List<Map<String, String>> lecturers = [
      {"stt": "1", "mgv": "GV001", "ten": "Giảng viên 1", "khoa": "Khoa 1", "hocvi": "Tiến sĩ"},
      {"stt": "2", "mgv": "GV002", "ten": "Giảng viên 2", "khoa": "Khoa 2", "hocvi": "Thạc sĩ"},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey[100]),
        headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        columns: const <DataColumn>[
          DataColumn(label: Text("STT")),
          DataColumn(label: Text("Mã GV")),
          DataColumn(label: Text("Tên giảng viên")),
          DataColumn(label: Text("Khoa")),
          DataColumn(label: Text("Học hàm - học vị")),
          DataColumn(label: Text("#")),
        ],
        rows: lecturers.map((lecturer) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(lecturer["stt"]!)),
              DataCell(Text(lecturer["mgv"]!)),
              DataCell(Text(lecturer["ten"]!)),
              DataCell(Text(lecturer["khoa"]!)),
              DataCell(Text(lecturer["hocvi"]!)),
              DataCell(Row(
                children: [
                  _buildActionButton(text: "Xem", color: const Color(0xFF26A69A), onPressed: () {}),
                  _buildActionButton(text: "Sửa", color: const Color(0xFF4CAF50), onPressed: () {}),
                  _buildActionButton(text: "Xóa", color: const Color(0xFFE53935), onPressed: () {}),
                ],
              )),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _PaginationControls extends StatelessWidget {
  const _PaginationControls();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hiển thị 1-2 của 2 giảng viên",
          style: TextStyle(color: Colors.grey[600]),
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text("Trước")),
            _buildPaginationButton("1", isSelected: true),
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text),
      ),
    );
  }
}
