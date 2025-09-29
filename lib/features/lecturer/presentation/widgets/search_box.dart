import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final VoidCallback? onFilterTap;
  final ValueChanged<String>? onChanged;

  const SearchBox({
    super.key,
    this.onFilterTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Tìm kiếm lớp học phần...',
                  border: InputBorder.none,
                  isDense: true,
                ),
                onChanged: onChanged,
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
