import 'package:flutter/material.dart';

class KostStatusWidget extends StatelessWidget {
  final VoidCallback onBackPressed; // Tambahkan callback

  const KostStatusWidget({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Status Kost',
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
                  child: const Icon(Icons.home, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pembayaran kos',
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
                GestureDetector(
                  onTap: onBackPressed, // Panggil callback saat ditekan
                  child: const Icon(Icons.chevron_left, color: Color(0xFF846200)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Status pembayaran kos anda :',
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
                'Belum bayar',
                style: TextStyle(
                  color: Color(0xFF846200),
                ),
              ),
              Text(
                'Bulan :',
                style: TextStyle(
                  color: Color(0xFF846200),
                ),
              ),
              Text(
                'Desember',
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
                'Rp.700.000',
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
}