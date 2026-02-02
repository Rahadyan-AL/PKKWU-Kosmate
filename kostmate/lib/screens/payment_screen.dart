import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              // Tambahkan konten untuk layar pembayaran kost di sini sesuai desain
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pembayaran Kost',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF846200),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Konten untuk layar pembayaran kost akan ditambahkan di sini.',
                      style: TextStyle(
                        color: Color(0xFF846200),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                _buildBottomNavItem('assets/images/homeicon.png', 0),
                _buildBottomNavItem('assets/images/groubicon.png', 1),
                _buildBottomNavItem('assets/images/smileyicon.png', 2),
                _buildBottomNavItem('assets/images/laundryicon.png', 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String iconPath, int index) {
    return GestureDetector(
      onTap: () {
        // Tidak perlu setState karena ini adalah screen statis
        // Untuk navigasi, Anda bisa gunakan Navigator.pushReplacementNamed
        // atau set state di HomeScreen jika menggunakan Stateful
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == 0 ? Colors.white : Colors.transparent, // Highlight untuk ikon home (kost)
          border: Border.all(
            color: index == 0 ? const Color(0xFFFFD045) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Image.asset(
          iconPath,
          width: 32,
          height: 32,
          color: index == 0 ? const Color(0xFF846200) : Colors.grey[600],
        ),
      ),
    );
  }
}