import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/header_lecturer.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/bottom_nav.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/search_box.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/class_card.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/pages/class_detail_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> _classes = const [
    {
      'title': 'Android',
      'code': 'CSE123_02',
      'subtitle': 'Hiện đang quản lý 2 lớp',
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
          const HeaderLecturer(),

          // SearchBox
          SearchBox(
            onFilterTap: () {
              // xử lý lọc
            },
            onChanged: (value) {
              // xử lý search
            },
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 90),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Môn Học Quản Lý',
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
                        title: _classes[i]['title']!,
                        code: _classes[i]['code']!,
                        subtitle: _classes[i]['subtitle']!,
                        selected: i == 0,
                        onMoreTap: () {
                          _showOptions(context, _classes[i]['title']!);
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

  void _showOptions(BuildContext context, String className) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Chi tiết lớp'),
              onTap: () {
                Navigator.of(context).pop();
                // 👉 Mở chi tiết từ menu "Chi tiết lớp"
                final selectedClass = _classes.firstWhere(
                      (c) => c['title'] == className,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ClassDetailPage(classData: selectedClass),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Chỉnh sửa'),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Xóa'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
