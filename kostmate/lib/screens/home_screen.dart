import 'package:flutter/material.dart';
import 'dart:async';
import 'kost_status_widget.dart'; // Pastikan file ini ada dan tidak error

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _autoScrollTimer; // Jadikan nullable untuk safety
  bool _userInteracted = false;

  // State untuk menentukan konten status pembayaran
  String _currentStatus = 'default'; // 'default', 'catering', 'laundry', 'kost'

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel(); // Cancel jika sudah ada
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_userInteracted) {
        _userInteracted = false;
        return;
      }
      // Gunakan _currentIndex alih-alih _pageController.page untuk menghindari akses sebelum build
      if (_currentIndex < 2) {
        _pageController.animateToPage(
          _currentIndex + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _autoScrollTimer?.cancel(); // Berhenti di akhir
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index; // Update index saat page berubah
      _userInteracted = true; // Tandai bahwa user telah berinteraksi
    });
    // Reset timer setelah 5 detik tidak ada interaksi
    Future.delayed(const Duration(seconds: 5), () {
      if (!_userInteracted) {
        _startAutoScroll(); // Mulai ulang timer jika tidak ada interaksi
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        backgroundColor: const Color(0xFFFFD740),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello, Username!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF846200),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.person_outline, color: const Color(0xFF846200)),
                            const SizedBox(width: 8),
                            const Text('Profil kamu', style: TextStyle(color: Color(0xFF846200))),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.notifications_outlined, color: const Color(0xFF846200)),
                            const SizedBox(width: 8),
                            const Text('Notifikasi', style: TextStyle(color: Color(0xFF846200))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Bagian Status Pembayaran (dinamis)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Status Pembayaran',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF846200),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (_currentStatus == 'default') ...[
                        _buildPaymentItem('Catering', 'Minggu ke 1, Belum bayar', 'assets/images/smileyicon.png'),
                        const SizedBox(height: 12),
                        _buildPaymentItem('Laundry', 'Sedang dicuci', 'assets/images/laundryicon.png'),
                        const SizedBox(height: 12),
                        _buildPaymentItem('Pembayaran kos', 'Minggu ke 1, Belum bayar', 'assets/images/homeicon.png'),
                      ] else if (_currentStatus == 'kost') ...[
                        KostStatusWidget(
                          onBackPressed: () {
                            setState(() {
                              _currentStatus = 'default';
                            });
                          },
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Wadah untuk carousel
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 160, // Tinggi carousel
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: 3, // Hanya 3 halaman
                          onPageChanged: _onPageChanged,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, pageIndex) {
                            // Setiap halaman menampilkan 2 kotak
                            return Row(
                              children: List.generate(2, (i) {
                                int itemIndex = pageIndex * 2 + i; // 0,1 -> 2,3 -> 4,5
                                if (itemIndex >= 6) {
                                  return Container(); // Fallback jika melebihi jumlah item
                                }
                                return Expanded( // <-- GUNAKAN EXPANDED UNTUK MENGHINDARI OVERFLOW
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: Colors.grey[300]!),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Titik Indikator (hanya 3 titik)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (i) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: i == _currentIndex // Gunakan _currentIndex alih-alih _pageController.page
                                    ? const Color.fromARGB(255, 235, 195, 19)
                                    : Colors.grey[300],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Atur Keuanganmu Disini',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF846200),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildFinanceRow('Tabungan', 'Rp. 2.000.000,00'),
                      const SizedBox(height: 8),
                      _buildFinanceRow('Pengeluaran bulan ini', 'Rp. 1.000.000,00'),
                      const SizedBox(height: 8),
                      _buildFinanceRow('Total tagihan', 'Rp. 500.000,00'),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/finance_detail');
                          },
                          child: const Text(
                            'Show all →',
                            style: TextStyle(
                              color: Color(0xFF846200),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      // Fallback jika ada error
      return Scaffold(
        body: Center(
          child: Text('Error: $e\nPeriksa console untuk detail.'),
        ),
      );
    }
  }

  Widget _buildPaymentItem(String title, String subtitle, String iconPath) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        width: 32,
        height: 32,
        errorBuilder: (context, error, stackTrace) => Icon(Icons.error, color: Colors.red), // Fallback jika asset gagal
      ),
      title: Text(title, style: const TextStyle(color: Color(0xFF846200), fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Color(0xFF846200))),
      trailing: const Icon(Icons.chevron_right, color: const Color(0xFF846200)),
      onTap: () {
        try {
          if (title == 'Catering') {
            Navigator.pushNamed(context, '/catering_status');
          } else if (title == 'Laundry') {
            Navigator.pushNamed(context, '/laundry_status');
          } else if (title == 'Pembayaran kos') {
            setState(() {
              _currentStatus = 'kost';
            });
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Navigasi gagal: $e')),
          );
        }
      },
    );
  }

  Widget _buildFinanceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF846200))),
        Text(value, style: const TextStyle(color: Color(0xFF846200), fontWeight: FontWeight.bold)),
      ],
    );
  }
}