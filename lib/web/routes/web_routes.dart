class WebRoutes {
  // Auth
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  // Mobile Student
  static const String studentHome = '/sinh-vien/trang-chu';

  // Lecturer
  static const String lecturer = '/giang-vien/trang-chu';
  static const String scheduleLecturer = '/giang-vien/lich-day';
  static const String attendanceLecturer = '/giang-vien/diem-danh';
  static const String reportLecturer = '/giang-vien/bao-cao';
  static const String profileLecturer = '/giang-vien/thong-tin';

  // Training Department
  static const String trainingDepartment = '/phong-dao-tao/trang-chu';
  static const String scheduleTrainingDepartment = '/phong-dao-tao/lich-giang-day';
  static const String facultyManagement = '/phong-dao-tao/quan-ly-khoa';
  static const String majorManagement = '/phong-dao-tao/quan-ly-nganh';
  static const String lecturerManagement = '/phong-dao-tao/quan-ly-giang-vien';
  static const String classManagement = '/phong-dao-tao/quan-ly-lop-hoc';
  static const String studentManagement = '/phong-dao-tao/quan-ly-sinh-vien';
  static const String subjectManagement = '/phong-dao-tao/quan-ly-mon-hoc';
  static const String roomManagement = '/phong-dao-tao/quan-ly-phong-hoc';
  static const String attendanceManagement = '/phong-dao-tao/quan-ly-diem-danh';
}
