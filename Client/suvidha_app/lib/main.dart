import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suvidha_app/features/HomeScreen/homeScreen.dart';
import 'package:suvidha_app/features/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // Typical mobile design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Suvidha',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A73E8)),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xFFF3F5FA),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Color(0xFFF7F9FC),
              border: OutlineInputBorder(),
            ),
          ),
          home: const AuthGate(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  Future<bool> _hasValidToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');

    if (token == null) return false;

    if (JwtDecoder.isExpired(token)) {
    await prefs.remove('authToken');
    return false;
  }

    // Simple version: assume valid until backend says otherwise
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _hasValidToken(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // Show splash / loading while checking
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == true) {
          return const Homescreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
