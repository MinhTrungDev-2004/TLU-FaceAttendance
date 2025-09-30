import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/header_lecturer.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/search_box.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/bottom_nav.dart';

class ClassDetailPage extends StatelessWidget {
  final Map<String, dynamic> classData;

  const ClassDetailPage({super.key, required this.classData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderLecturer(),

          // SearchBox
          SearchBox(
            onFilterTap: () {},
            onChanged: (value) {},
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            classData['name'] ?? '64A.01',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.more_vert, color: Colors.black54),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Row(
                        children: const [
                          Icon(Icons.calendar_today,
                              size: 16, color: Colors.black54),
                          SizedBox(width: 6),
                          Text("Ca 1 thứ 3, 5, 7",
                              style: TextStyle(color: Colors.black87)),
                        ],
                      ),
                      const SizedBox(height: 6),

                      Row(
                        children: const [
                          Icon(Icons.access_time,
                              size: 16, color: Colors.black54),
                          SizedBox(width: 6),
                          Text("Ngày bắt đầu: 14/7/2025"),
                        ],
                      ),
                      const SizedBox(height: 6),

                      Row(
                        children: const [
                          Icon(Icons.access_time,
                              size: 16, color: Colors.black54),
                          SizedBox(width: 6),
                          Text("Ngày kết thúc: 17/8/2025"),
                        ],
                      ),
                      const SizedBox(height: 6),

                      Row(
                        children: const [
                          Icon(Icons.people_alt_outlined,
                              size: 16, color: Colors.black54),
                          SizedBox(width: 6),
                          Text("Sĩ số: 45"),
                        ],
                      ),
                    ],
                  ),
                );
              },
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
