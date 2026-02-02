import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD740),
      body: SafeArea(
        child: Center(
          child: Text(
            'Komunitas Screen',
            style: TextStyle(fontSize: 24, color: const Color(0xFF846200)),
          ),
        ),
      ),
      // Hapus bottomNavigationBar dari sini
    );
  }
}