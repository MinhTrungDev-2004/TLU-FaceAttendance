class UserModel {
  final String userid;
  final String email;
  final String name;
  final String role;
  final String? className;
  final String? department;
  final String? faceUrl;
  final bool isActive;
  final bool isFaceRegistered;

  UserModel({
    required this.userid,
    required this.email,
    required this.name,
    required this.role,
    this.className,
    this.department,
    this.faceUrl,
    this.isFaceRegistered = false,
    this.isActive = true,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      userid: data['userid'] ?? '',
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      role: data['role'] ?? '',
      className: data['class'] ?? '',
      department: data['department'] ?? '',
      faceUrl: data['face_url'] ?? '',
      isFaceRegistered: data['is_face_registered'] ?? false,
      isActive: data['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'email': email,
      'name': name,
      'role': role,
      'class': className,
      'department': department,
      'face_url': faceUrl,
      'is_face_registered': isFaceRegistered,
      'is_active': isActive,
    };
  }
}
