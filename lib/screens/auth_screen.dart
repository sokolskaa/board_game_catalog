import 'package:flutter/material.dart';
import '../core/widgets/custom_button.dart';
import '../core/widgets/custom_text_field.dart';
import 'main_navigation.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, bottom: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade100,
                    Colors.blue.shade50,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1565C0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.casino_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'BoardGame Tracker',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isSignIn ? 'Welcome back!' : 'Create your account',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isSignIn = true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSignIn ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: isSignIn
                                      ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                    )
                                  ]
                                      : [],
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isSignIn
                                          ? const Color(0xFF1565C0)
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isSignIn = false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: !isSignIn ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: !isSignIn
                                      ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                    )
                                  ]
                                      : [],
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: !isSignIn
                                          ? const Color(0xFF1565C0)
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (isSignIn) _buildSignInForm() else _buildSignUpForm(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'By continuing, you agree to our Terms & Privacy Policy',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Column(
      children: [
        const CustomTextField(
          hintText: 'Email address',
          prefixIcon: Icons.mail_outline,
        ),
        const SizedBox(height: 12),
        const CustomTextField(
          hintText: 'Password',
          prefixIcon: Icons.lock_outline,
          isPassword: true,
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Color(0xFF1565C0),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        CustomButton(
          text: 'Sign In',
          onPressed: () {
            // Перехід на головну навігацію з нижнім баром
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey.shade300)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'or',
                style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey.shade300)),
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Sign Up',
          isOutlined: true,
          onPressed: () {
            setState(() => isSignIn = false);
          },
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        const CustomTextField(
          hintText: 'Email address',
          prefixIcon: Icons.mail_outline,
        ),
        const SizedBox(height: 12),
        const CustomTextField(
          hintText: 'Password',
          prefixIcon: Icons.lock_outline,
          isPassword: true,
        ),
        const SizedBox(height: 12),
        const CustomTextField(
          hintText: 'Confirm password',
          prefixIcon: Icons.lock_outline,
          isPassword: true,
        ),
        const SizedBox(height: 24),
        CustomButton(
          text: 'Create Account',
          onPressed: () {
            // Також переходить на головну навігацію з нижнім баром
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
            );
          },
        ),
      ],
    );
  }
}