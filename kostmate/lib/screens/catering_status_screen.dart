import 'package:flutter/material.dart';

class CateringStatusScreen extends StatelessWidget {
  const CateringStatusScreen({super.key});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status Catering',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF846200),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF846200),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.local_dining, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Catering',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF846200),
                                  ),
                                ),
                                const Text(
                                  'Minggu ke 1, Belum bayar',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF846200),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector( // Ubah dari Icon menjadi GestureDetector
                            onTap: () {
                              // Kembali ke Home Screen
                              Navigator.popUntil(context, ModalRoute.withName('/main_app'));
                            },
                            child: const Icon(Icons.chevron_left, color: Color(0xFF846200)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Status catering anda :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF846200),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Keterangan :',
                          style: TextStyle(
                            color: Color(0xFF846200),
                          ),
                        ),
                        Text(
                          'Catering',
                          style: TextStyle(
                            color: Color(0xFF846200),
                          ),
                        ),
                        Text(
                          'Paket :',
                          style: TextStyle(
                            color: Color(0xFF846200),
                          ),
                        ),
                        Text(
                          'Mingguan',
                          style: TextStyle(
                            color: Color(0xFF846200),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Harga :',
                          style: TextStyle(
                            color: Color(0xFF846200),
                          ),
                        ),
                        Text(
                          'Rp.105.000',
                          style: TextStyle(
                            color: Color(0xFF846200),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Payment :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF846200),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildPaymentButton('Gopay'),
                        const SizedBox(width: 8),
                        _buildPaymentButton('Dana'),
                      ],
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
                      'Catering Di sekitar kamu :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF846200),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF846200),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.local_dining, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Catering Ranau',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF846200),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Jl. Darmo Kertini',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF846200),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFFFD740), // Warna sama dengan background screen
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD740), // Warna sama dengan background screen
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

  Widget _buildPaymentButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF846200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
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
          color: index == 2 ? Colors.white : Colors.transparent, // Highlight untuk ikon smiley (catering)
          border: Border.all(
            color: index == 2 ? const Color(0xFFFFD045) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Image.asset(
          iconPath,
          width: 32,
          height: 32,
          color: index == 2 ? const Color(0xFF846200) : Colors.grey[600],
        ),
      ),
    );
  }
}