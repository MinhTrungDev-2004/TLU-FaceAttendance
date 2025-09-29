import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/header_lecturer.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/bottom_nav.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  final List<Map<String, dynamic>> schedules = const [
    {
      "date": "Thứ 6, Ngày 26/9/2025",
      "classes": [
        {
          "time": "07:00",
          "subject": "Phát triển ứng dụng cho các thiết bị di động (64KTPM3 + 64KTPM.NB)",
          "room": "225-A2",
          "period": "Tiết: 1-3"
        },
        {
          "time": "09:45",
          "subject": "Chuyên đề Kỹ thuật phần mềm (64KTPM3)",
          "room": "225-A2",
          "period": "Tiết: 4 - 6"
        },
      ]
    },
    {
      "date": "Thứ 7, Ngày 27/9/2025",
      "classes": [
        {
          "time": "07:00",
          "subject": "Chuyên đề Kỹ thuật phần mềm (64KTPM3)",
          "room": "225-A2",
          "period": "Tiết: 1-3"
        },
      ]
    },
    {
      "date": "Thứ 2, Ngày 29/9/2025",
      "classes": [
        {
          "time": "13:30",
          "subject": "Nền tảng Web (64KTPM2)",
          "room": "301-A3",
          "period": "Tiết: 7-9"
        },
        {
          "time": "15:30",
          "subject": "Công nghệ phần mềm (64KTPM1)",
          "room": "202-B1",
          "period": "Tiết: 10-12"
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1675FF),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            indicatorColor: Colors.yellow,
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: "Hôm nay"),
              Tab(text: "Lịch dạy"),
              Tab(text: "Tải lịch"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Hôm nay. Ví dụ ngày đầu tiên trong danh sách
            _buildScheduleList([schedules[0]]),

            // Tất cả các ngày
            _buildScheduleList(schedules),

            // Tải lịch
            const Center(
              child: Text(
                "Chức năng tải lịch",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const LecturerBottomNav
          (currentIndex: 1),
      ),
    );
  }

  /// Danh sách ngày + lớp học
  Widget _buildScheduleList(List<Map<String, dynamic>> days) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: days.length,
      itemBuilder: (context, dayIndex) {
        final day = days[dayIndex];
        final classes = day["classes"] as List<dynamic>;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Text(
                day["date"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ...classes.map((cls) => _buildScheduleCard(
              time: cls["time"],
              subject: cls["subject"],
              room: cls["room"],
              period: cls["period"],
            )),
          ],
        );
      },
    );
  }

  /// Card lớp học
  Widget _buildScheduleCard({
    required String time,
    required String subject,
    required String room,
    required String period,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Giờ học
          Center(
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Nội dung
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // căn giữa dọc
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(room, style: const TextStyle(fontSize: 13)),
                    const SizedBox(width: 8),
                    Text(period, style: const TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
