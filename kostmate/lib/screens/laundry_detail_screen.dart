import 'package:flutter/material.dart';

class LaundryDetailScreen extends StatelessWidget {
  const LaundryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD740), // Warna latar belakang utama
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
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: const Color(0xFF846200), // Placeholder untuk gambar
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Laundry Cepat',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF846200),
                            ),
                          ),
                        ],
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
                      'Paket Laundry :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF846200),
                      ),
                    ),
                    const Divider(
                      color: Color(0xFF846200),
                      thickness: 1,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Antar jemput : Rp. 4.000,00 / kg',
                      style: TextStyle(
                        color: Color(0xFF846200),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Cuci saja : Rp. 2.000,00 / kg',
                      style: TextStyle(
                        color: Color(0xFF846200),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Cuci kering : Rp. 3.000,00 / kg',
                      style: TextStyle(
                        color: Color(0xFF846200),
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
                      'Pesanan laundry :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF846200),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildButton('Antar jemput'),
                        _buildButton('Antar sendiri'),
                        _buildButton('Express'),
                        _buildButton('Normal'),
                        _buildButton('Cuci Kering'),
                        _buildButton('Cuci Saja'),
                        _buildButton('Mingguan'),
                        _buildButton('Bulanan'),
                        _buildButton('Per hari'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        backgroundColor: const Color(0xFFFFD740),
                        foregroundColor: const Color(0xFF846200),
                      ),
                      child: const Text('Pesanan Sekarang'),
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

  Widget _buildButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF846200),
          fontSize: 12,
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
          color: index == 3 ? Colors.white : Colors.transparent, // Highlight untuk ikon laundry
          border: Border.all(
            color: index == 3 ? const Color(0xFFFFD045) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Image.asset(
          iconPath,
          width: 32,
          height: 32,
          color: index == 3 ? const Color(0xFF846200) : Colors.grey[600],
        ),
      ),
    );
  }
}