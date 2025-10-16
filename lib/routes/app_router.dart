import 'package:flutter/material.dart';
import '../features/admin/presentation/pages/admin_layout.dart';

class AppRouter {
  static const String adminLayout = '/admin';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case adminLayout:
      case '/':
        return MaterialPageRoute(
          builder: (_) => const AdminLayout(), // ❌ bỏ child
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Trang không tồn tại')),
          ),
        );
    }
  }
}
