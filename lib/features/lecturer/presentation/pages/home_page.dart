import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/features/auth/presentation/pages/login_page.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/bottom_nav.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/header_lecturer.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/class_card.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/pages/report_page.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/pages/profile_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBottomIndex = 0;

  final List<Map<String, String>> _classes = [
    {'title': 'Android', 'code': 'CSE123_02', 'subtitle': 'Hiện đang quản lý 2 lớp'},
    {'title': 'Công nghệ Web', 'code': 'CSE123_02', 'subtitle': 'Hiện đang quản lý 2 lớp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LecturerHeader(
            onFilterTap: () {
              // Hàm xử lý lọc
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

                for (int i = 0; i < _classes.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
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
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: LecturerBottomNav(
        currentIndex: _selectedBottomIndex,
        onTap: (idx) {
          setState(() {
            _selectedBottomIndex = idx;
          });
        },
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
              onTap: () => Navigator.of(context).pop(),
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

