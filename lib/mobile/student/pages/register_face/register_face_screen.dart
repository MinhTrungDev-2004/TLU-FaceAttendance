import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'widgets/face_card.dart';
import 'widgets/notice_box.dart';


class RegisterFaceScreen extends StatelessWidget {
  const RegisterFaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    // Tối ưu cho Samsung Galaxy Note 5 (5.7 inch, 1440x2560)
    final double appBarHeight = 60; // Chiều cao cố định cho AppBar
    final double horizontalPadding = screenWidth * 0.05; // 5% chiều rộng màn hình
    final double verticalPadding = screenHeight * 0.02; // 2% chiều cao màn hình

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Status bar spacer để tránh bị che bởi status bar
          Container(
            height: MediaQuery.of(context).padding.top,
            color: const Color(0xFF1470E2),
          ),
          
          // AppBar tùy chỉnh
          Container(
            width: screenWidth,
            height: appBarHeight,
            decoration: const BoxDecoration(
              color: Color(0xFF1470E2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                // --- Nút quay lại ---
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back, 
                    color: Colors.white, 
                    size: 24,
                  ),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),

                // --- Tiêu đề ngang hàng với nút ---
                const Expanded(
                  child: Text(
                    'Đăng ký khuôn mặt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                // Thêm khoảng trống để cân bằng
                const SizedBox(width: 48),
              ],
            ),
          ),

          // --- Nội dung thân trang ---
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  children: [
                    // FaceCard với kích thước tối ưu
                    SizedBox(
                      width: screenWidth,
                      child: FaceCard(),
                    ),
                    
                    SizedBox(height: screenHeight * 0.02), // 2% chiều cao màn hình
                    
                    // NoticeBox với kích thước tối ưu
                    SizedBox(
                      width: screenWidth,
                      child: NoticeBox(),
                    ),
                    
                    // Thêm khoảng trống ở cuối để tránh bị che bởi bottom navigation
                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
