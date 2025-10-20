import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'face_camera_screen.dart';

class FirstTimeFaceRegistration extends StatefulWidget {
  final String userId;
  final String userName;
  
  const FirstTimeFaceRegistration({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  State<FirstTimeFaceRegistration> createState() => _FirstTimeFaceRegistrationState();
}

class _FirstTimeFaceRegistrationState extends State<FirstTimeFaceRegistration> {
  bool _isLoading = false;
  bool _isCapturing = false;
  String? _capturedImagePath;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final appBarHeight = isTablet ? 120.0 : 100.0;

    return WillPopScope(
      onWillPop: () async => false, // Không cho phép quay lại
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, appBarHeight),
          child: Container(
            height: appBarHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1470E2), Color(0xFF0D5BB8)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    // Không có nút back vì đây là bước bắt buộc
                    const SizedBox(width: 48), // Để cân bằng layout
                    Expanded(
                      child: Text(
                        'Đăng ký khuôn mặt',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 24 : 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 48), // Để cân bằng layout
                  ],
                ),
              ),
            ),
          ),
        ),
        body: _isLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Color(0xFF1470E2)),
                    SizedBox(height: 16),
                    Text('Đang xử lý...'),
                  ],
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Welcome message
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF1470E2), Color(0xFF0D5BB8)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.face_retouching_natural,
                            size: 60,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Chào mừng ${widget.userName}!',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Để sử dụng tính năng điểm danh bằng khuôn mặt, bạn cần đăng ký khuôn mặt lần đầu.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),

                    // Face registration card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blue, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.account_box_outlined, color: Colors.black, size: 28),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "Thiết lập nhận diện khuôn mặt",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          
                          // Camera placeholder or captured image
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: _capturedImagePath != null ? Colors.green[50] : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(60),
                              border: Border.all(
                                color: _capturedImagePath != null ? Colors.green : Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: _capturedImagePath != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(58),
                                    child: Image.file(
                                      File(_capturedImagePath!),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(Icons.camera_alt, color: Colors.grey, size: 50),
                          ),
                          
                          const SizedBox(height: 16),
                          Text(
                            _capturedImagePath != null
                                ? "Ảnh khuôn mặt đã được chụp thành công!"
                                : "Chúng tôi sẽ chụp một vài bức ảnh để thiết lập đăng ký khuôn mặt cho tài khoản của bạn",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _capturedImagePath != null ? Colors.green[700] : Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Action button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _isCapturing ? null : _openCamera,
                              icon: _isCapturing
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    )
                                  : Icon(
                                      _capturedImagePath != null ? Icons.camera_alt : Icons.add_a_photo,
                                      color: Colors.white,
                                    ),
                              label: Text(
                                _isCapturing
                                    ? "Đang chụp..."
                                    : _capturedImagePath != null
                                        ? "Chụp lại"
                                        : "Bắt đầu chụp ảnh",
                                style: const TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1470E2),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Instructions
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline, color: Colors.orange[700], size: 20),
                              const SizedBox(width: 8),
                              Text(
                                "Lưu ý",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.orange[700],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "• Đảm bảo môi trường có ánh sáng tốt\n"
                            "• Nhìn thẳng vào camera trong suốt quá trình\n"
                            "• Không đeo kính râm, khẩu trang hoặc mũ\n"
                            "• Giữ khuôn mặt trong khung hình\n"
                            "• Quá trình sẽ mất khoảng 10 đến 15 giây",
                            style: TextStyle(fontSize: 14, height: 1.5),
                          ),
                        ],
                      ),
                    ),

                    if (_capturedImagePath != null) ...[
                      const SizedBox(height: 24),
                      
                      // Complete registration button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _completeRegistration,
                          icon: const Icon(Icons.check, color: Colors.white),
                          label: const Text(
                            "Hoàn tất đăng ký",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[600],
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _openCamera() async {
    await _requestCameraPermission();
    
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không tìm thấy camera')),
      );
      return;
    }

    setState(() {
      _isCapturing = true;
    });

    try {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FaceCameraScreen(
            cameras: cameras,
            onFaceCaptured: (imagePath) {
              setState(() {
                _capturedImagePath = imagePath;
                _isCapturing = false;
              });
            },
          ),
        ),
      );

      if (result != null) {
        setState(() {
          _capturedImagePath = result;
          _isCapturing = false;
        });
      } else {
        setState(() {
          _isCapturing = false;
        });
      }
    } catch (e) {
      setState(() {
        _isCapturing = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $e')),
      );
    }
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      _showPermissionDialog();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quyền truy cập Camera'),
        content: const Text(
          'Ứng dụng cần quyền truy cập camera để chụp ảnh khuôn mặt. Vui lòng cấp quyền trong cài đặt.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Cài đặt'),
          ),
        ],
      ),
    );
  }

  Future<void> _completeRegistration() async {
    if (_capturedImagePath == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Upload image to Firebase Storage
      final ref = FirebaseStorage.instance
          .ref()
          .child('face_images')
          .child('${widget.userId}_${DateTime.now().millisecondsSinceEpoch}.jpg');
      
      final uploadTask = ref.putFile(File(_capturedImagePath!));
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // Save to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .set({
        'userId': widget.userId,
        'userName': widget.userName,
        'faceImageUrl': downloadUrl,
        'registeredAt': FieldValue.serverTimestamp(),
        'isActive': true,
        'hasRegisteredFace': true,
      }, SetOptions(merge: true));

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng ký khuôn mặt thành công!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to main app
      Navigator.pushReplacementNamed(context, '/sinh-vien/trang-chu');
      
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
