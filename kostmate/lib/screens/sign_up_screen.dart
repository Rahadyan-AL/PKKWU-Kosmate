import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang dengan CustomPaint (sama seperti Login)
          CustomPaint(
            painter: DiagonalCurvePainter(),
            size: MediaQuery.of(context).size,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D4037), // Coklat tua
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Container Utama Form (isi: TextField, Button, Link)
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD045), // Kuning cerah
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildTextField('Username'),
                          const SizedBox(height: 16),
                          _buildTextField('Email'),
                          const SizedBox(height: 16),
                          _buildTextField('Password', obscure: true),
                          const SizedBox(height: 16),
                          _buildTextField('Phone number'),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () => Navigator.pushReplacementNamed(context, '/main_app'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              backgroundColor: const Color(0xFF846200), // Warna sesuai permintaan
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('SIGN UP', style: TextStyle(fontFamily: 'Poppins', fontSize: 18)),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Do you have account?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF5D4037), // Coklat tua
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, '/login'),
                                child: const Text(
                                  ' Sign In', // Perhatikan spasi di depan
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF5D4037), // Ubah warna menjadi coklat tua, sama seperti teks sebelumnya
                                    fontFamily: 'Poppins',
                                  ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF5D4037),
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFDA6D), // Warna isi TextField
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFFFD700)), // Warna border aktif
            ),
            constraints: const BoxConstraints(maxHeight: 50),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}

// Custom Painter untuk garis diagonal melengkung (sama seperti Login)
class DiagonalCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Path untuk area atas (kuning keemasan)
    paint.color = const Color(0xFFFFBF00);
    final pathTop = Path()
      ..moveTo(0, 100) // Mulai dari kiri, sedikit di bawah 'Sign Up'
      ..quadraticBezierTo(
          size.width * 0.3, 80, // Kontrol point 1
          size.width * 0.6, 100) // Titik tengah
      ..quadraticBezierTo(
          size.width * 0.9, 120, // Kontrol point 2
          size.width, 100) // Akhir di kanan
      ..lineTo(size.width, 0) // Lanjutkan ke atas kanan
      ..lineTo(0, 0) // Kembali ke atas kiri
      ..close();
    canvas.drawPath(pathTop, paint);

    // Path untuk area bawah (krem muda dengan gradien ke kuning)
    paint.shader = ui.Gradient.linear(
      Offset(0, 100), // Mulai gradien dari garis
      Offset(0, size.height), // Akhir gradien ke bawah
      [
        const Color(0xFFFFD700), // Kuning dekat garis
        const Color(0xFFFFF9E6), // Krem muda di bawah
      ],
    );
    final pathBottom = Path()
      ..moveTo(0, 100) // Mulai dari kiri, sedikit di bawah 'Sign Up'
      ..quadraticBezierTo(
          size.width * 0.3, 120, // Kontrol point 1
          size.width * 0.6, 100) // Titik tengah
      ..quadraticBezierTo(
          size.width * 0.9, 80, // Kontrol point 2
          size.width, 100) // Akhir di kanan
      ..lineTo(size.width, size.height) // Lanjutkan ke bawah kanan
      ..lineTo(0, size.height) // Kembali ke bawah kiri
      ..close();
    canvas.drawPath(pathBottom, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}