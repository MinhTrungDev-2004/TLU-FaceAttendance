import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/routes/web_routes.dart';
import 'package:tlu_face_attendance/web/training_department/widgets/side_menu.dart';

class MajorPage extends StatefulWidget {
  const MajorPage({super.key});

  @override
  State<MajorPage> createState() => _MajorPageState();
}

class _MajorPageState extends State<MajorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideMenu(selectedRoute: WebRoutes.majorManagement),
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
                    'Quản lý ngành',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Chào mừng bạn đến với trang quản lý ngành học',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),
                  _ActionBar(),
                  SizedBox(height: 20),
                  Expanded(child: _MajorDataSection()),
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
  const _ActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 350,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Nhập tên ngành',
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
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Thêm ngành'),
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

class _MajorDataSection extends StatelessWidget {
  const _MajorDataSection({super.key});

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
          Text(
            'Danh sách ngành',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(child: _MajorDataTable()),
          SizedBox(height: 20),
          _PaginationControls(),
        ],
      ),
    );
  }
}

class _MajorDataTable extends StatelessWidget {
  const _MajorDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> majors = [
      {'stt': '1', 'ma': 'N001', 'ten': 'Kỹ thuật phần mềm'},
      {'stt': '2', 'ma': 'N002', 'ten': 'Hệ thống thông tin'},
      {'stt': '3', 'ma': 'N003', 'ten': 'Khoa học máy tính'},
    ];

    return DataTable(
      headingRowColor: MaterialStateProperty.all(Colors.grey[100]),
      headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      columns: const <DataColumn>[
        DataColumn(label: Text('STT')),
        DataColumn(label: Text('Mã ngành')),
        DataColumn(label: Text('Tên ngành')),
        DataColumn(label: Text('#')),
      ],
      rows: majors.map((m) {
        return DataRow(
          cells: <DataCell>[
            DataCell(Text(m['stt']!)),
            DataCell(Text(m['ma']!)),
            DataCell(Text(m['ten']!)),
            const DataCell(Row(
              children: [
                _TableButton(text: 'Xem', color: Color(0xFF26A69A)),
                _TableButton(text: 'Sửa', color: Color(0xFF4CAF50)),
                _TableButton(text: 'Xóa', color: Color(0xFFE53935)),
              ],
            )),
          ],
        );
      }).toList(),
    );
  }
}

class _TableButton extends StatelessWidget {
  final String text;
  final Color color;
  const _TableButton({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {},
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
}

class _PaginationControls extends StatelessWidget {
  const _PaginationControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hiển thị 1-3 của 3 ngành',
          style: TextStyle(color: Colors.grey[600]),
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text('Trước')),
            _pageBtn('1', isSelected: true),
            TextButton(onPressed: () {}, child: const Text('Tiếp >')),
          ],
        ),
      ],
    );
  }

  Widget _pageBtn(String text, {bool isSelected = false}) {
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
