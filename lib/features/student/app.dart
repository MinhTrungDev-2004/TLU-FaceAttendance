import 'package:flutter/material.dart';
import 'presentation/pages/register_face/register_face_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Face Attendance Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: true,
      ),
      // ⚠️ Tạm thời vẫn test màn hình sinh viên
      home: const RegisterFaceScreen(),
    );
  }
}
