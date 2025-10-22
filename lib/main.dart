import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tlu_face_attendance/firebase_options.dart';
// import 'package:tlu_face_attendance/web/routes/web_router.dart';
// import 'package:tlu_face_attendance/web/routes/web_routes.dart';
import 'package:tlu_face_attendance/mobile/student/pages/routes/mobile_router.dart';
import 'package:tlu_face_attendance/mobile/student/pages/routes/mobile_routes.dart';
//import 'mobile/student/pages/register_face/register_face_screen.dart';


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
      title: 'TLU Attendance',
      initialRoute: MobileRoutes.splash,
      onGenerateRoute: MobileRouter.generateRoute,
      
    );
  }
}
