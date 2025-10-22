import 'package:firebase_auth/firebase_auth.dart'; // Import để xử lý FirebaseAuthException
import 'package:tlu_face_attendance/core/services/auth_service.dart';
import 'package:tlu_face_attendance/core/models/user_model.dart';
import 'package:tlu_face_attendance/core/validation/validate.dart';

class LoginAuth {
  final AuthService authService;

  LoginAuth({required this.authService});

  Future<UserModel> login(String email, String password) async {
    try {
      // Double-check validation (dự phòng từ UI)
      final validation = Validation.validateLoginForm(
        email: email,
        password: password,
      );

      if (validation['email'] != null) {
        throw Exception(validation['email']!);
      }
      if (validation['password'] != null) {
        throw Exception(validation['password']!);
      }

      // Gọi AuthService để đăng nhập
      final user = await authService.loginUser(email.trim(), password);

      // Kiểm tra user tồn tại
      if (user == null) {
        throw Exception('Tài khoản không tồn tại');
      }

      // Kiểm tra vai trò (role)
      if (user.role != 'student') {
        throw Exception('Tài khoản không hợp lệ, chỉ sinh viên được phép đăng nhập');
      }

      // Kiểm tra tài khoản bị khóa (nếu UserModel có field isActive)
      if (user.isActive == false) {
        throw Exception('Tài khoản của bạn đã bị khóa, vui lòng liên hệ quản trị viên');
      }

      return user;
    } on FirebaseAuthException catch (e) {
      // Xử lý lỗi Firebase Auth cụ thể
      switch (e.code) {
        case 'user-not-found':
          throw Exception('Tài khoản không tồn tại');
        case 'wrong-password':
          throw Exception('Mật khẩu không chính xác');
        case 'invalid-email':
          throw Exception('Email không hợp lệ');
        case 'user-disabled':
          throw Exception('Tài khoản đã bị vô hiệu hóa');
        case 'too-many-requests':
          throw Exception('Quá nhiều lần thử, vui lòng thử lại sau 5 phút');
        default:
          throw Exception('Lỗi đăng nhập: ${e.message}');
      }
    } catch (e) {
      // Re-throw các lỗi khác (từ service hoặc validation)
      rethrow;
    }
  }

  // Phương thức reset password (hỗ trợ quên mật khẩu)
  Future<void> resetPassword(String email) async {
    try {
      // Kiểm tra email trước khi gửi
      final emailError = Validation.validateEmail(email);
      if (emailError != null) {
        throw Exception(emailError);
      }

      // Gọi AuthService để gửi email reset
      await authService.resetPassword(email);

      // Có thể thêm log hoặc thông báo thành công ở UI
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw Exception('Email không hợp lệ');
        case 'user-not-found':
          throw Exception('Không tìm thấy tài khoản với email này');
        default:
          throw Exception('Lỗi gửi email: ${e.message}');
      }
    } catch (e) {
      rethrow;
    }
  }
}