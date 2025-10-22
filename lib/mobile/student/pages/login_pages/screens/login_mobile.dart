import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/core/auth/login_auth.dart';
import 'package:tlu_face_attendance/core/validation/validate.dart';
import 'package:tlu_face_attendance/mobile/student/pages/routes/mobile_routes.dart';

class LoginPage extends StatefulWidget {
  final LoginAuth loginAuth; // Thêm dependency

  const LoginPage({super.key, required this.loginAuth});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Kiểm tra định dạng email
      final emailError = Validation.validateEmail(_usernameController.text);
      if (emailError != null) {
        throw emailError;
      }

      // Gọi LoginAuth để đăng nhập
      final user = await widget.loginAuth.login(
        _usernameController.text,
        _passwordController.text,
      );

      // Chuyển hướng đến màn hình chính
      if (mounted) {
        Navigator.pushReplacementNamed(context, MobileRoutes.home);
      }
    } catch (e) {
      // Hiển thị lỗi
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo và các phần giao diện khác giữ nguyên...
              Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/logo_school.png',
                    width: 90,
                    height: 90,
                    color: const Color(0xFF005CFF),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                "Đăng nhập",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _usernameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Tài khoản",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                  hintText: "Nhập tài khoản",
                  hintStyle: TextStyle(color: Colors.black38),
                  prefixIcon:
                      Icon(Icons.person_outline, color: Colors.black45, size: 22),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  labelStyle: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                  hintText: "Nhập mật khẩu",
                  hintStyle: const TextStyle(color: Colors.black38),
                  prefixIcon: const Icon(Icons.lock_outline,
                      color: Colors.black45, size: 22),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black38,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 1),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Xử lý quên mật khẩu
                  },
                  child: const Text(
                    "Quên mật khẩu?",
                    style: TextStyle(color: Color(0xFF1470E2)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1470E2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isLoading ? null : _handleLogin,
                  child: _isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          "Đăng nhập",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}