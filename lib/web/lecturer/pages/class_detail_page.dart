import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/web/lecturer/widgets/header_lecturer.dart';
import 'package:tlu_face_attendance/web/lecturer/widgets/bottom_nav.dart';

class ClassDetailPage extends StatefulWidget {
  final Map<String, dynamic> classData; // Dữ liệu môn học được truyền vào

  const ClassDetailPage({super.key, required this.classData});

  @override
  State<ClassDetailPage> createState() => _ClassDetailPageState();
}

class _ClassDetailPageState extends State<ClassDetailPage> {
  late List<Map<String, dynamic>> _scheduleSessions;
  bool _selectAll = false;

  final Map<int, Map<String, TextEditingController>> _controllers = {};

  @override
  void initState() {
    super.initState();
    _scheduleSessions = _getMockScheduleData();

    // Khởi tạo controllers cho mỗi hàng
    for (var session in _scheduleSessions) {
      final id = session['id'] as int;
      _controllers[id] = {
        'lt': TextEditingController(text: session['lectPeriod'].toString()),
        'th': TextEditingController(text: session['labPeriod'].toString()),
        'title': TextEditingController(text: session['lessonTitle']),
        'feedback': TextEditingController(text: session['feedback']),
        'lecturer1': TextEditingController(text: session['lecturer1']),
        'lecturer2': TextEditingController(text: session['lecturer2']),
        'subLecturer': TextEditingController(text: session['subLecturer']),
        'subApproved': TextEditingController(text: session['subApproved']),
        'absent':
        TextEditingController(text: session['absentStudents'].toString()),
      };
    }
  }

  @override
  void dispose() {
    for (final map in _controllers.values) {
      for (final controller in map.values) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  // Hàm lấy dữ liệu giả lập (Không đổi)
  List<Map<String, dynamic>> _getMockScheduleData() {
    return [
      {
        'id': 1,
        'selected': false,
        'date': '20/08/2025',
        'day': 'Thứ 5',
        'time': '12 giờ 45 17 giờ 25',
        'lectPeriod': 2,
        'labPeriod': 3,
        'lessonTitle': 'Giới thiệu môn học\nLập trình Java căn bản',
        'format': 'Trực tuyến',
        'feedback': '',
        'lecturer1': 'Kiều Tuấn Dũng',
        'lecturer2': '',
        'subLecturer': '',
        'subApproved': '',
        'room': 'P.403 Máy-GD2',
        'makeupDay': '',
        'totalStudents': 45,
        'absentStudents': 15,
      },
      {
        'id': 2,
        'selected': false,
        'date': '04/09/2025',
        'day': 'Thứ 5',
        'time': '12 giờ 45-17 giờ 25',
        'lectPeriod': 2,
        'labPeriod': 3,
        'lessonTitle': 'Tổng quan về lập trình hướng đối tượng',
        'format': 'Trực tiếp tại',
        'feedback': '',
        'lecturer1': 'Kiều Tuấn Dũng',
        'lecturer2': '',
        'subLecturer': '',
        'subApproved': '',
        'room': 'P.403 Máy-GD2',
        'makeupDay': '',
        'totalStudents': 45,
        'absentStudents': 0,
      },
      {
        'id': 3,
        'selected': false,
        'date': '11/09/2025',
        'day': 'Thứ 5',
        'time': '12 giờ 45-17 giờ 25',
        'lectPeriod': 2,
        'labPeriod': 3,
        'lessonTitle': 'Lớp và Đối tượng',
        'format': 'Trực tiếp tại',
        'feedback': '',
        'lecturer1': 'Kiều Tuấn Dũng',
        'lecturer2': '',
        'subLecturer': '',
        'subApproved': '',
        'room': 'P.403 Máy-GD2',
        'makeupDay': '',
        'totalStudents': 45,
        'absentStudents': 6,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            const HeaderLecturer(title: "Chi tiết lớp học"),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'LỊCH TRÌNH: ${widget.classData['title']?.toUpperCase() ?? 'CHI TIẾT MÔN HỌC'}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                )
              ],
            ),
          ),

          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              thickness: 8.0,
              radius: const Radius.circular(4.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: _buildDataTable(),
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: const LecturerBottomNav(
        currentIndex: 0,
      ),
    );
  }

  // Xây dựng Bảng dữ liệu
  Widget _buildDataTable() {
    // --- ĐÃ SỬA: Dùng Container(alignment: Alignment.center) để căn giữa tiêu đề ---
    final List<DataColumn> columns = [
      DataColumn(
        label: Container( // Dùng Container
          alignment: Alignment.center, // Căn giữa
          child: Checkbox(
            value: _selectAll,
            onChanged: (val) {
              setState(() {
                _selectAll = val!;
                for (var session in _scheduleSessions) {
                  session['selected'] = val;
                }
              });
            },
          ),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Thứ/Ngày', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Thời gian', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Số tiết\nLT', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Số tiết\nTH/TN', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Tên bài', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Hình thức', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Góp ý về \n cơ sở vật chất', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Giảng viên 1', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Giảng viên 2', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Giảng viên\ndạy thay', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Duyệt dạy\nthay', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Phòng học', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Ngày dạy bù', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Tổng số\nSV', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('Số SV\nvắng mặt', textAlign: TextAlign.center),
        ),
      ),
      DataColumn(
        label: Container(
          alignment: Alignment.center, // Căn giữa
          child: Text('#', textAlign: TextAlign.center),
        ),
      ),
    ];
    // --- KẾT THÚC SỬA TIÊU ĐỀ ---

    final List<DataRow> rows = _scheduleSessions.map((session) {
      final id = session['id'] as int;
      final sessionControllers = _controllers[id]!;

      return DataRow(
        selected: session['selected'],
        // Căn giữa nội dung ô (Giữ nguyên)
        cells: [
          DataCell(
            Center(
              child: Checkbox(
                value: session['selected'],
                onChanged: (val) {
                  setState(() {
                    session['selected'] = val!;
                  });
                },
              ),
            ),
          ),
          DataCell(Center(child: Text('${session['day']}\n${session['date']}', textAlign: TextAlign.center))),
          DataCell(
            Center(
              child: SizedBox(
                width: 85,
                child: Text(session['time'], textAlign: TextAlign.center),
              ),
            ),
          ),
          DataCell(Center(child: _buildTextField(sessionControllers['lt']!, width: 40))),
          DataCell(Center(child: _buildTextField(sessionControllers['th']!, width: 40))),
          DataCell(Center(child: _buildTextField(sessionControllers['title']!, width: 200, maxLines: null))),
          DataCell(Center(child: _buildFormatDropdown(session, width: 150))),
          DataCell(Center(child: _buildTextField(sessionControllers['feedback']!, width: 100, maxLines: null))),
          DataCell(Center(child: _buildTextField(sessionControllers['lecturer1']!, width: 150))), // Sử dụng controller
          DataCell(Center(child: _buildTextField(sessionControllers['lecturer2']!, width: 100))), // Sử dụng controller
          DataCell(Center(child: _buildTextField(sessionControllers['subLecturer']!, width: 100))), // Sử dụng controller
          DataCell(Center(child: _buildTextField(sessionControllers['subApproved']!, width: 100))), // Sử dụng controller
          DataCell(Center(child: Text(session['room']))),
          DataCell(Center(child: _buildTextField(TextEditingController(text: session['makeupDay']), width: 100))),
          DataCell(Center(child: Text(session['totalStudents'].toString()))),
          DataCell(Center(child: _buildTextField(sessionControllers['absent']!, width: 60))),
          DataCell(Center(child: _buildActionButtons(session))),
        ],
      );
    }).toList();

    return DataTable(
      border: TableBorder.all(
        color: Colors.black45, // Đường viền
        width: 1.0,
      ),
      columns: columns,
      rows: rows,
      columnSpacing: 16.0,
      horizontalMargin: 12.0,
      dataRowMinHeight: 60.0,
      dataRowMaxHeight: 100.0,
      headingRowHeight: 60.0,
    );
  }

  // Widget trợ giúp cho các trường văn bản (Căn giữa text bên trong)
  Widget _buildTextField(
      TextEditingController controller, {
        double? width,
        int? maxLines = 1,
      }) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        textAlign: TextAlign.center, // Căn giữa văn bản
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        ),
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  // Widget trợ giúp cho dropdown (Căn giữa lựa chọn)
  Widget _buildFormatDropdown(Map<String, dynamic> session, {double width = 150}) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<String>(
        initialValue: session['format'],
        alignment: Alignment.center, // Căn giữa lựa chọn
        items: ['Trực tuyến', 'Trực tiếp tại']
            .map((label) => DropdownMenuItem(
          value: label,
          child: Text(label, style: const TextStyle(fontSize: 14)),
        ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              session['format'] = value;
            });
          }
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        ),
      ),
    );
  }

  // Widget trợ giúp cho các nút hành động (Không đổi)
  Widget _buildActionButtons(Map<String, dynamic> session) {
    final key = ValueKey(session['id']);
    return Column(
      key: key,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionButton(
          'Xóa',
          Colors.red,
              () {
            setState(() {
              _scheduleSessions.removeWhere((s) => s['id'] == session['id']);
              _controllers
                  .remove(session['id'])
                  ?.values
                  .forEach((c) => c.dispose());
            });
          },
        ),
        _actionButton(
          'Đ.Danh',
          Colors.green,
              () {},
        ),
        _actionButton(
          'Lưu',
          Colors.blue,
              () {},
        ),
      ],
    );
  }

  // Widget trợ giúp cho một nút hành động (Không đổi)
  Widget _actionButton(String label, Color color, VoidCallback onPressed) {
    return SizedBox(
      height: 28,
      width: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          textStyle: const TextStyle(fontSize: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}