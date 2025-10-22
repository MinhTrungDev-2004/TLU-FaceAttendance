import 'package:flutter/material.dart';
import 'package:tlu_face_attendance/core/auth/login_auth.dart';
import 'package:tlu_face_attendance/core/services/auth_service.dart';
import 'package:tlu_face_attendance/mobile/student/pages/login_pages/screens/login_mobile.dart';
import '../login_pages/screens/splash_screen.dart';
import '../home/home_page.dart';
import 'mobile_routes.dart';
import '../register_face/register_face_screen.dart';

class MobileRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MobileRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case MobileRoutes.login:
        return MaterialPageRoute(
          builder: (_) => LoginPage(
            loginAuth: LoginAuth(
              authService: AuthServiceImpl(),
            ),
          ),
        );
      case MobileRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case MobileRoutes.registerFace:
        return MaterialPageRoute(builder: (_) => const RegisterFaceScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Trang không tồn tại')),
          ),
        );
    }
  }
}
