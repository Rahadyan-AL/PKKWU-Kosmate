import 'package:flutter/material.dart';
import 'dart:ui'; // Untuk PlatformDispatcher
import 'dart:async'; // Untuk Future 
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/main_app_screen.dart'; // Import screen utama baru
import 'screens/catering_status_screen.dart';
import 'screens/laundry_status_screen.dart';
import 'screens/finance_detail_screen.dart';


// ... (kode inisialisasi dan error handler lainnya sama seperti sebelumnya) ...

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan binding siap

  // Contoh inisialisasi opsional (hapus jika tidak digunakan)
  // await initializeMyServices();

  // Penanganan error dari Flutter (misalnya, error saat build widget)
  FlutterError.onError = (FlutterErrorDetails details) {
    // Tetap tampilkan error di log
    FlutterError.presentError(details);

    // Log tambahan (bisa diganti dengan kirim ke layanan log eksternal)
    print('FlutterError: ${details.exceptionAsString()}');
    print('Stack: ${details.stack}');
    print('Context: ${details.context}'); // Informasi konteks opsional

    // Opsional: Hentikan aplikasi di mode release saat error Flutter terjadi
    // if (kReleaseMode) exit(1);
  };

  // Penanganan error dari Platform (misalnya, error async di onPressed)
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    // Log error (bisa diganti dengan kirim ke layanan log eksternal)
    print('PlatformDispatcher Error: $error');
    print('Stack: $stack');

    // Kembalikan true untuk menandai bahwa error telah ditangani
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KostMate',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // Ubah initialRoute dan routes
      initialRoute: '/', // Asumsikan ini tetap Onboarding
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/main_app': (context) => const MainAppScreen(), // Route ke MainAppScreen
        '/catering_status': (context) => const CateringStatusScreen(),
        '/laundry_status': (context) => const LaundryStatusScreen(),
        '/finance_detail': (context) => const FinanceDetailScreen(),
      },
      // Widget kustom untuk error build phase
      builder: (context, widget) {
        Widget error = const Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) => error;
        if (widget != null) return widget;
        // Ini seharusnya tidak pernah terjadi jika MaterialApp digunakan dengan benar
        throw StateError('widget is null');
      },
    );
  }
}