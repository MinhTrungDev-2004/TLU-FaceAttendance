import 'package:flutter/material.dart';

class LecturerHeader extends StatelessWidget {
  final VoidCallback? onFilterTap;

  const LecturerHeader({super.key, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, topPadding + 14, 16, 20),
      decoration: const BoxDecoration(
        color: Color(0xFF1675FF),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            const Expanded(
              child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm lớp học phần...',
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            IconButton(
              onPressed: onFilterTap,
              icon: const Icon(Icons.filter_list, color: Colors.grey),
              splashRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
