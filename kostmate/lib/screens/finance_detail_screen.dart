import 'package:flutter/material.dart';

class FinanceDetailScreen extends StatelessWidget {
  const FinanceDetailScreen({super.key});

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
                      'Pengeluaran',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Bulan ini',
                            style: TextStyle(color: Color(0xFF846200)),
                          ),
                          Text(
                            'Rp. 2.000.000,00',
                            style: TextStyle(color: Color(0xFF846200)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Minggu ini',
                            style: TextStyle(color: Color(0xFF846200)),
                          ),
                          Text(
                            'Rp. 1.500.000,00',
                            style: TextStyle(color: Color(0xFF846200)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Hari ini',
                            style: TextStyle(color: Color(0xFF846200)),
                          ),
                          Text(
                            'Rp. 100.000,00',
                            style: TextStyle(color: Color(0xFF846200)),
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
                      'Detail Pengeluaran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF846200),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Table(
                      border: TableBorder.all(color: const Color(0xFF846200).withOpacity(0.3)),
                      columnWidths: const {
                        0: FixedColumnWidth(80),
                        1: FlexColumnWidth(2),
                        2: FixedColumnWidth(80),
                        3: FixedColumnWidth(60),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                          ),
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Tanggal',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF846200)),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Keterangan',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF846200)),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Nominal',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF846200)),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Pembayaran',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF846200)),
                              ),
                            ),
                          ],
                        ),
                        ...List.generate(
                          20,
                          (index) => TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  '20 / 09 / 2025',
                                  style: const TextStyle(color: Color(0xFF846200)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Makan seblak',
                                  style: const TextStyle(color: Color(0xFF846200)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  '15.000,00',
                                  style: const TextStyle(color: Color(0xFF846200)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Debit',
                                  style: const TextStyle(color: Color(0xFF846200)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
          color: index == 0 ? Colors.white : Colors.transparent,
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