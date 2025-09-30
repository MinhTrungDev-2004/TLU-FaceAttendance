import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/features/lecturer/presentation/widgets/bottom_nav.dart';


class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1675FF),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chọn lớp học phần
            const Text(
              "Chọn lớp học phần",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: "Lập trình ứng dụng di động - 64KTPM3",
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              items: const [
                DropdownMenuItem(
                  value: "Lập trình ứng dụng di động - 64KTPM3",
                  child: Text("Lập trình ứng dụng di động - 64KTPM3"),
                ),
                DropdownMenuItem(
                  value: "Hệ quản trị cơ sở dữ liệu - 64HTTT",
                  child: Text("Hệ quản trị cơ sở dữ liệu - 64HTTT"),
                ),
              ],
              onChanged: (value) {},
            ),

            const SizedBox(height: 20),

            // Chi tiết các buổi điểm danh
            const Text(
              "Chi tiết các buổi điểm danh",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: ListView(
                children: [
                  _buildSessionCard("Buổi 1 - 29/9/2025", "Có mặt: 60, Vắng: 4"),
                  _buildSessionCard("Buổi 2 - 30/9/2025", "Có mặt: 60, Vắng: 4"),
                  _buildSessionCard("Buổi 3 - 1/10/2025", "Có mặt: 60, Vắng: 4"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Nút xuất báo cáo
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1675FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Xuất báo cáo",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFCCCCCC), // 👈 màu #ccc
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const LecturerBottomNav(
        currentIndex: 3,
      ),

    );
  }

  Widget _buildSessionCard(String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
