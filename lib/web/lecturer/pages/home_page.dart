import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/lecturer/widgets/header_lecturer.dart';
import 'package:tlu_face_attendance/web/lecturer/widgets/bottom_nav.dart';
import 'package:tlu_face_attendance/web/lecturer/widgets/search_box.dart';
import 'package:tlu_face_attendance/web/lecturer/widgets/class_card.dart';
import 'package:tlu_face_attendance/web/lecturer/pages/class_detail_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> _classes = const [
    {
      'title': 'Android - CSE123_02',
      'code': 'Thứ 5',
      'subtitle': 'Ngày 28/08/2025',
      'schedule': 'Ca 1 thứ 2, 4, 6',
      'startDate': '14/7/2025',
      'endDate': '17/8/2025',
      'studentCount': '45',
    },
    {
      'title': 'Nền Tảng Web',
      'code': 'CSE124_01',
      'subtitle': 'Hiện đang quản lý 3 lớp',
      'schedule': 'Ca 2 thứ 3, 5, 7',
      'startDate': '14/7/2025',
      'endDate': '17/8/2025',
      'studentCount': '60',
    },
    {
      'title': 'Công nghệ Phần Mềm',
      'code': 'CSE125_03',
      'subtitle': 'Hiện đang quản lý 1 lớp',
      'schedule': 'Ca 3 thứ 2, 4, 6',
      'startDate': '14/7/2025',
      'endDate': '17/8/2025',
      'studentCount': '40',
    },
    {
      'title': 'Cấu Trúc Dữ Liệu và Giải Thuật',
      'code': 'CSE126_02',
      'subtitle': 'Hiện đang quản lý 2 lớp',
      'schedule': 'Ca 4 thứ 3, 5, 7',
      'startDate': '14/7/2025',
      'endDate': '17/8/2025',
      'studentCount': '50',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header chung
            const HeaderLecturer(title: "Trang chủ"),

          // SearchBox
          const SearchBox(
            hintText: "Tìm kiếm lớp học...",
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 90),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Các Lớp Học Phần',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Xem tất cả'),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // List các môn học
                for (int i = 0; i < _classes.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: GestureDetector(
                      onTap: () {
                        // 👉 Khi ấn vào card sẽ đi sang trang chi tiết
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ClassDetailPage(classData: _classes[i]),
                          ),
                        );
                      },
                      child: ClassCard(
                        className: _classes[i]['title']!,
                        subject: _classes[i]['subtitle']!,
                        time: _classes[i]['time'] ?? "07:00",
                        room: _classes[i]['room'] ?? "A101",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassDetailPage(
                                classData: _classes[i],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: const LecturerBottomNav(
        currentIndex: 0,
      ),
    );
  }
}
