import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kostmate/main.dart'; // Ganti dengan nama package Anda jika berbeda

void main() {
  testWidgets('App starts on OnboardingScreen and handles errors gracefully', (WidgetTester tester) async {
    // Buat instance MyApp
    const app = MyApp();

    // Pump MyApp ke dalam test environment
    await tester.pumpWidget(app);

    // Verifikasi bahwa OnboardingScreen (atau widget root dari route '/') muncul
    // Karena OnboardingScreen adalah StatelessWidget yang di-build oleh MaterialApp,
    // kita bisa mencari elemen-elemen spesifik di dalamnya.
    // Misalnya, cari teks judul atau logo.
    // Ganti teks berikut dengan elemen yang benar-benar muncul di OnboardingScreen Anda.
    expect(find.text('KosMate is an app dedicates to help you'), findsOneWidget); // Contoh teks dari slide 1
    // Atau, jika Anda ingin test lebih umum untuk memastikan layar pertama muncul:
    // expect(find.byType(Image), findsOneWidget); // Jika logo muncul di semua slide
    // expect(find.byType(PageView), findsOneWidget); // Karena OnboardingScreen menggunakan PageView

    // Verifikasi bahwa tidak ada ErrorWidget muncul secara default
    // Karena Anda memiliki ErrorWidget.builder kustom, kita bisa mencari teks kustom tersebut
    // untuk memastikan tidak ada kesalahan build yang terjadi saat inisialisasi.
    expect(find.text('...rendering error...'), findsNothing); // Sesuaikan dengan teks ErrorWidget Anda
  });

  // Contoh tambahan: Test navigasi dari Onboarding ke Login
  testWidgets('OnboardingScreen navigates to LoginScreen', (WidgetTester tester) async {
    const app = MyApp();
    await tester.pumpWidget(app);

    // Asumsikan tombol "Get Started" di OnboardingScreen mengarah ke '/login'
    // Anda perlu menemukan dan menekan tombol ini.
    // Misalnya, jika tombolnya memiliki teks 'Get Started':
    await tester.tap(find.text('Get Started')); // Ganti dengan teks tombol Anda
    await tester.pumpAndSettle(); // Tunggu animasi navigasi selesai

    // Verifikasi bahwa LoginScreen sekarang muncul
    expect(find.text('Sign In'), findsOneWidget); // Cari elemen unik dari LoginScreen
  });

  // Contoh tambahan: Test navigasi dari Login ke SignUp
  testWidgets('LoginScreen navigates to SignUpScreen', (WidgetTester tester) async {
    const app = MyApp();
    await tester.pumpWidget(app);

    // Asumsikan kita di LoginScreen (mungkin perlu navigasi dari Onboarding dulu)
    // Jika ingin test ini mandiri, Anda bisa langsung pump LoginScreen saja:
    // await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Asumsikan ada link "Sign Up" di LoginScreen
    await tester.tap(find.text('Sign Up')); // Ganti dengan teks link Anda
    await tester.pumpAndSettle(); // Tunggu animasi navigasi selesai

    // Verifikasi bahwa SignUpScreen sekarang muncul
    expect(find.text('Sign Up'), findsOneWidget); // Cari judul SignUpScreen
  });

  // Tambahkan test-widget lain sesuai kebutuhan Anda.
  // Misalnya, test input di form login, tampilan item di list laundry, dll.
}