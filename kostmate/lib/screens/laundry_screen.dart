import 'package:flutter/material.dart';

class LaundryScreen extends StatelessWidget {
  const LaundryScreen({super.key});

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
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: const Color(0xFF846200)),
                          const SizedBox(width: 8),
                          const Text('Cari', style: TextStyle(color: Color(0xFF846200))), // Teks bisa di-klik
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Text('Filter', style: TextStyle(color: Color(0xFF846200))),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_drop_down, color: const Color(0xFF846200)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4, // Jumlah item laundry
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigasi ke halaman detail laundry
                      Navigator.pushNamed(context, '/laundry_detail');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
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
                                const SizedBox(height: 4),
                                const Text(
                                  'Rp. 3.000,00 / kg',
                                  style: TextStyle(
                                    color: Color(0xFF846200),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '1 Hari selesai',
                                  style: TextStyle(
                                    fontSize: 12,
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
                          ),
                          const Icon(Icons.chevron_right, color: Color(0xFF846200)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // Hapus bottomNavigationBar dari sini
    );
  }
}