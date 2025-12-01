import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics/app/screens/006_login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png', 
              width: 250, 
              height: 250,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            const Text(
              'Đang tải ứng dụng...',
              style: TextStyle(color: Colors.deepPurple, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}