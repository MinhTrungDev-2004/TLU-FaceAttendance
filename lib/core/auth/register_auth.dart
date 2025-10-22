import 'package:tlu_face_attendance/core/services/auth_service.dart';
import 'package:tlu_face_attendance/core/models/user_model.dart';

/// Lightweight wrapper used by UI to register a new user.
class RegisterAuth {
  final AuthService authService;

  RegisterAuth({required this.authService});

  /// Registers a user and returns the created [UserModel].
  /// Throws a human-friendly [Exception] on error.
  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
    required String role,
  }) async {
    try {
      final user = await authService.registerUser(email, password, name, role);
      return user;
    } catch (e) {
      // Re-throw so UI can show message. Keep message generic if unknown.
      throw Exception('Lỗi đăng ký: $e');
    }
  }
}
