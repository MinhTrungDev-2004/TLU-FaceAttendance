import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'routes/app_routes.dart';
import 'package:tlu_face_attendance/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // route mặc định khi khởi động app
      initialRoute: AppRoutes.login,

      // gọi router
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
