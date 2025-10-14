import 'package:flutter/material.dart';
import './widgets/home_menu.dart'; // 👈 import file menu riêng
import'../scan_qr/scan_qr_screen.dart';
import'../user_information/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    _HomeContent(),
    SizedBox(), // chỗ QR sẽ điều hướng sang trang riêng nên để trống
    PersonalPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      // 👇 Khi chọn "Quét QR", mở trang riêng
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QRScanScreen()),
      );
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = 104;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const HomeMenu(),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, appBarHeight),
        child: Builder(
          builder: (context) => Container(
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
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _selectedIndex == 0
                          ? 'Lớp học'
                          : _selectedIndex == 2
                              ? 'Cá nhân'
                              : '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1, color: Colors.grey, thickness: 0.8),
          BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: const Color(0xFF1470E2),
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_outlined),
                label: 'Quét QR',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Cá nhân',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Trang "Trang chủ"
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hôm nay bạn không có lịch học nào.',
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}


