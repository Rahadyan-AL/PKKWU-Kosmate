import 'package:flutter/material.dart';
import 'dart:async';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _autoScrollTimer;
  bool _userInteracted = false;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollTimer.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_userInteracted) {
        _userInteracted = false;
        return;
      }
      if (_currentPage < 2) { // Hanya 3 layar
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _autoScrollTimer.cancel(); // Berhenti di slide terakhir
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      _userInteracted = true; // Tandai bahwa user telah berinteraksi
    });
    // Reset timer setelah 5 detik tidak ada interaksi
    Future.delayed(const Duration(seconds: 5), () {
      if (!_userInteracted) {
        _startAutoScroll(); // Mulai ulang timer jika tidak ada interaksi
      }
    });
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFFFF9E6), // Krem muda
                  const Color(0xFFFFE082), // Kuning lembut
                ],
              ),
            ),
          ),

          // Decorative Blobs (Opacity 41%)
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFD700).withOpacity(0.41),
              ),
            ),
          ),
          Positioned(
            top: -80,
            right: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFD700).withOpacity(0.41),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFD700).withOpacity(0.41),
              ),
            ),
          ),

          // PageView Content
          PageView.builder(
            controller: _pageController,
            itemCount: 3, // Hanya 3 layar
            onPageChanged: _onPageChanged,
            physics: const AlwaysScrollableScrollPhysics(), // <-- Aktifkan swipe manual
            itemBuilder: (context, index) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/FullLogo.png',
                        height: 120,
                        color: const Color(0xFFFFD700), // Logo selalu kuning, termasuk di slide 3
                      ),
                      const SizedBox(height: 40),
                      if (index < 2) // Teks deskriptif hanya di layar 1 & 2
                        Text(
                          _getPageTitle(index),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF5D4037), // Coklat tua
                            fontFamily: 'Poppins',
                          ),
                        ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (i) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 12,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: i == _currentPage
                                  ? const Color(0xFFFFD700) // Kuning solid aktif
                                  : const Color(0xFFFFE082), // Kuning transparan non-aktif
                            ),
                          ),
                        ),
                      ),
                      if (index == 2) // Tombol Get Started hanya di layar 3
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: ElevatedButton(
                            onPressed: _navigateToLogin,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 12,
                              ),
                              backgroundColor: const Color(0xFFFFD740),
                              foregroundColor: const Color(0xFF846200),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Get Started'),
                                Text(' ->'),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'KosMate is an app dedicates to help you';
      case 1:
        return 'Kosmate helps you with boarding house problems';
      default:
        return '';
    }
  }
}