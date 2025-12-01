import 'package:flutter/material.dart';
import 'package:logistics/app/services/logger.dart';
import 'package:logistics/app/widgets/template/main_template.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static bool _isChecked = false;
  bool _isPasswordVisible = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainTemplateAppBar(content: buildLoginForm(), isShowAppBar: false);
  }

  Widget buildLoginForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.business_center,
                        size: 60,
                        color: Colors.deepPurple[700],
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Đăng Nhập',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 40),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Nhập email của bạn',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.deepPurple[700],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.deepPurple[700]!,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                hintText: 'Nhập mật khẩu',
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.deepPurple[700],
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.deepPurple[700]!,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              obscureText: !_isPasswordVisible,
            ),

            const SizedBox(height: 16),

           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                        },
                        activeColor: Colors.deepPurple[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Flexible(
                        child: Text(
                          'Ghi nhớ đăng nhập',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    logger.i('Forgot password pressed');
                  },
                  child: Text(
                    'Quên mật khẩu',
                    style: TextStyle(
                      color: Colors.deepPurple[700],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple[700]!,
                    Colors.deepPurple[500]!,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  logger.i('Login button pressed');
                  logger.i('Username: ${_usernameController.text}');
                  logger.i('Password: ${_passwordController.text}');
                  logger.i('Remember me: $_isChecked');
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'ĐĂNG NHẬP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
