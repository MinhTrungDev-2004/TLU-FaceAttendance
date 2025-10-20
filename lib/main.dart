import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tlu_face_attendance/firebase_options.dart';
import 'package:tlu_face_attendance/web/routes/web_router.dart';
import 'package:tlu_face_attendance/web/routes/web_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // route mặc định khi khởi động app
      initialRoute: WebRoutes.login,

      // gọi router
      onGenerateRoute: WebRouter.generateRoute,
    );
  }
}
