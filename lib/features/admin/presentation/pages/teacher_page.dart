import 'package:flutter/material.dart';
import 'AddTeacherForm.dart';

const Color primaryColor = Color(0xFF0D47A1);

class TeacherPage extends StatelessWidget {
  const TeacherPage({Key? key}) : super(key: key);

  // Dữ liệu mẫu
  List<Teacher> get teachers => [
    Teacher(
      id: 1,
      name: 'Nguyễn Văn A',
      email: 'nva@gmail.com',
      teacherCode: 'GV001',
      department: 'CNTT',
      subject: 'Lập trình Flutter',
      classCount: 3,
      password: '******',
    ),
    Teacher(
      id: 2,
      name: 'Trần Thị B',
      email: 'ttb@gmail.com',
      teacherCode: 'GV002',
      department: 'Kinh tế',
      subject: 'Kinh tế vi mô',
      classCount: 2,
      password: '******',
    ),
  ];

  static const Color backgroundColor = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // ✅ Nút tròn thêm giảng viên ở góc
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddTeacherForm(),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),

      // ✅ Nội dung chính
      body: Column(
        children: [
          // Thanh tiêu đề + ô tìm kiếm
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Danh sách giảng viên',
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bảng dữ liệu
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor:
                    MaterialStateProperty.all(Colors.grey[100]),
                    columns: const [
                      DataColumn(label: Text('STT', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Họ và tên', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Mã GV', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Khoa', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Bộ môn', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Số lớp dạy', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Mật khẩu', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Hành động', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: teachers.asMap().entries.map((entry) {
                      final i = entry.key;
                      final t = entry.value;
                      return DataRow(cells: [
                        DataCell(Text('${i + 1}')),
                        DataCell(Text(t.name)),
                        DataCell(Text(t.email)),
                        DataCell(Text(t.teacherCode)),
                        DataCell(Text(t.department)),
                        DataCell(Text(t.subject)),
                        DataCell(Text('${t.classCount}')),
                        DataCell(Text(t.password)),
                        DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit,
                                  color: Color(0xFF2196F3)),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Color(0xFFF44336)),
                              onPressed: () {},
                            ),
                          ],
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Teacher {
  final int id;
  final String name;
  final String email;
  final String teacherCode;
  final String department;
  final String subject;
  final int classCount;
  final String password;

  Teacher({
    required this.id,
    required this.name,
    required this.email,
    required this.teacherCode,
    required this.department,
    required this.subject,
    required this.classCount,
    required this.password,
  });
}
