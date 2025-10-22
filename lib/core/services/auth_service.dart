import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tlu_face_attendance/core/models/user_model.dart';

abstract class AuthService {
  Future<UserModel?> loginUser(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> logout();
  Future<UserModel> registerUser(String email, String password, String name, String role);
  // Thêm các phương thức khác nếu cần (ví dụ: registerUser, saveFaceData)
}

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel?> loginUser(String email, String password) async {
    try {
      // Đăng nhập bằng Firebase Authentication
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // Lấy dữ liệu người dùng từ Firestore
      final userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!userDoc.exists) {
        throw Exception('Không tìm thấy thông tin người dùng trong Firestore');
      }

      // Chuyển đổi dữ liệu Firestore thành UserModel
      return UserModel.fromMap(userDoc.data()!);
    } on FirebaseAuthException {
      // Ném lỗi để LoginAuth xử lý
      rethrow;
    } catch (e) {
      throw Exception('Lỗi không xác định khi đăng nhập: $e');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      // Gửi email đặt lại mật khẩu qua Firebase
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException {
      // Ném lỗi để LoginAuth xử lý
      rethrow;
    } catch (e) {
      throw Exception('Lỗi không xác định khi gửi email đặt lại mật khẩu: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      // Đăng xuất khỏi Firebase
      await _auth.signOut();
    } catch (e) {
      throw Exception('Lỗi khi đăng xuất: $e');
    }
  }

  // (Tùy chọn) Phương thức đăng ký người dùng
  Future<UserModel> registerUser(String email, String password, String name, String role) async {
    try {
      // Tạo người dùng mới bằng Firebase Authentication
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // Lưu thông tin người dùng vào Firestore
      final userData = UserModel(
        userid: userCredential.user!.uid,
        email: email.trim(),
        name: name,
        role: role,
        isFaceRegistered: false,
      );

    await _firestore
      .collection('users')
      .doc(userCredential.user!.uid)
      .set(userData.toMap());

      return userData;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception('Email đã được sử dụng');
        case 'invalid-email':
          throw Exception('Email không hợp lệ');
        case 'weak-password':
          throw Exception('Mật khẩu quá yếu');
        default:
          throw Exception('Lỗi đăng ký: ${e.message}');
      }
    } catch (e) {
      throw Exception('Lỗi không xác định khi đăng ký: $e');
    }
  }

  // (Tùy chọn) Phương thức lưu dữ liệu khuôn mặt (nếu cần)
  Future<void> saveFaceData(String userId, dynamic faceData) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .update({'faceData': faceData});
    } catch (e) {
      throw Exception('Lỗi khi lưu dữ liệu khuôn mặt: $e');
    }
  }
}