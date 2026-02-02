import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'community_screen.dart';
import 'catering_screen.dart';
import 'laundry_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          HomeScreen(),      // Index 0
          CommunityScreen(), // Index 1
          CateringScreen(),  // Index 2
          LaundryScreen(),   // Index 3
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(30), // Sudut bulat kiri-kanan
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem('assets/images/homeicon.png', 0, 'Home'),
                _buildBottomNavItem('assets/images/groubicon.png', 1, 'Community'),
                _buildBottomNavItem('assets/images/smileyicon.png', 2, 'Catering'),
                _buildBottomNavItem('assets/images/laundryicon.png', 3, 'Laundry'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String iconPath, int index, String label) {
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == index ? Colors.white : Colors.transparent,
          border: Border.all(
            color: _currentIndex == index ? const Color(0xFFFFD045) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Image.asset(
          iconPath,
          width: 32,
          height: 32,
          color: _currentIndex == index ? const Color(0xFF846200) : Colors.grey[600],
        ),
      ),
    );
  }
}