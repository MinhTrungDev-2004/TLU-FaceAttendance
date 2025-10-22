import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/core/auth/login_auth.dart';
import 'package:tlu_face_attendance/core/services/auth_service.dart';
import 'login_mobile.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Dùng Future.delayed thay vì Timer (cách hiện đại hơn)
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => LoginPage(
              loginAuth: LoginAuth(
                authService: AuthServiceImpl(),
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F0FF), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/logo_tlu.png', // đường dẫn logo của bạn
              height: 120,
            ),

            const SizedBox(height: 24),

            

            const SizedBox(height: 24),

            // Text
            

            const SizedBox(height: 40),

            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF005CFF)),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
