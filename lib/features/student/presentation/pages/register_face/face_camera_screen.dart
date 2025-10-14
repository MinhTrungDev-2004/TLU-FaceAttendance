import 'dart:async';
import 'package:flutter/material.dart';
import 'face_succes_register_screen.dart';

class FaceCameraScreen extends StatefulWidget {
  const FaceCameraScreen({super.key});

  @override
  State<FaceCameraScreen> createState() => _FaceCameraScreenState();
}

class _FaceCameraScreenState extends State<FaceCameraScreen> {
  int _stateIndex = 0; // 0 = chưa thấy mặt, 1 = trái, 2 = phải, 3 = thẳng
  final Set<int> _capturedStates = {};
  Timer? _mockTimer;

  @override
  void initState() {
    super.initState();
    _startMockFaceTracking();
  }

  @override
  void dispose() {
    _mockTimer?.cancel();
    super.dispose();
  }

  // --- Mô phỏng camera ---
  void _startMockFaceTracking() {
    _mockTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _stateIndex = (_stateIndex % 3) + 1;
      });
      _attemptCapture(_stateIndex);
    });
  }

  // --- Xử lý chụp ---
  void _attemptCapture(int state) async {
    if (_capturedStates.contains(state)) return;

    setState(() => _capturedStates.add(state));

    // Đủ 3 hướng thì hoàn tất
    if (_capturedStates.length >= 3) {
      _mockTimer?.cancel();
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const FaceRegisterSuccessScreen()),
        );
      }
    }
  }

  // --- Văn bản hướng dẫn ---
  String get hintText {
    switch (_stateIndex) {
      case 0:
        return 'Đưa mặt vào khung camera';
      case 1:
        return 'Xin vui lòng nghiêng sang trái';
      case 2:
        return 'Xin vui lòng nghiêng sang phải';
      case 3:
        return 'Xin vui lòng nhìn thẳng';
      default:
        return '';
    }
  }

  // --- Giao diện ---
  @override
  Widget build(BuildContext context) {
    final double appBarHeight = 104;
    final double appBarWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size(appBarWidth, appBarHeight),
        child: Container(
          height: appBarHeight,
          decoration: const BoxDecoration(
            color: Color(0xFF1470E2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  // --- Nút quay lại ---
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),

                  // --- Tiêu đề căn trái ---
                  const Text(
                    'Đăng ký khuôn mặt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final capturedCount = _capturedStates.length;
    final percent = (capturedCount / 3);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildCameraFrame(),
          const SizedBox(height: 24),
          Text(
            hintText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            '${(percent * 100).toInt()}%',
            style: const TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: percent,
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation(Colors.green.shade400),
            minHeight: 6,
          ),
        ],
      ),
    );
  }

  // --- Khung camera kiểu “đơn giản, không bo trắng ngoài” ---
  Widget _buildCameraFrame() {
    return Container(
      width: 309,
      height: 450,
      decoration: BoxDecoration(
        color: Colors.black,
        
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Vòng tròn nhận diện khuôn mặt
          Container(
            width: 245,
            height: 340,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.greenAccent, width: 2),
              borderRadius:
                  const BorderRadius.all(Radius.elliptical(120, 160)),
            ),
          ),

          // Ảnh minh họa hoặc icon khi chưa nhận diện
          if (_capturedStates.isEmpty)
            const Icon(Icons.person_outline,
                color: Colors.white38, size: 72)
          else
            ClipRRect(
              borderRadius:
                  const BorderRadius.all(Radius.elliptical(110, 150)),
              child: Image.network(
                'https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=800&auto=format&fit=crop&q=60',
                width: 220,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
