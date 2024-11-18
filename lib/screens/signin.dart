import 'package:flutter/material.dart';
import 'package:technest/blocks/colors.dart';
import 'package:flutter_text_box/flutter_text_box.dart';
import 'package:technest/screens/signup.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bcolor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          // Logo at the top
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Image.asset(
                'assets/file.png', // Path to your logo image
                width: 100,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Login Form
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              decoration: BoxDecoration(
                color: AppColors.bcolor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title text
                  const Text(
                    'Login to your Account',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Email TextBox
                  TextBoxIcon(
                    icon: Icons.email_outlined,
                    inputType: TextInputType.emailAddress,
                    label: 'Email',
                    hint: 'Enter your email',
                    errorText: 'This field is required!',
                    onSaved: (String? value) {},
                  ),
                  const SizedBox(height: 16),

                  // Password TextBox
                  TextBoxIcon(
                    icon: Icons.lock_outline,
                    inputType: TextInputType.text,
                    label: 'Password',
                    hint: 'Enter your password',
                    obscure: true,
                    errorText: 'This field is required!',
                    onSaved: (String? value) {},
                  ),
                  const SizedBox(height: 24),

                  // Sign In Button
                  ElevatedButton(
                    onPressed: () {
                      // Add login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.tcolor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Social Media Sign In
                  const Text(
                    '- Or sign in with -',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google icon container
                      _buildSocialButton(
                        'assets/google.png',
                            () {
                          // Google sign-in logic
                        },
                      ),
                      const SizedBox(width: 16),

                      // Facebook icon container
                      _buildSocialButton(
                        'assets/facebook.png',
                            () {
                          // Facebook sign-in logic
                        },
                      ),
                      const SizedBox(width: 16),

                      // Twitter icon container
                      _buildSocialButton(
                        'assets/twitter.png',
                            () {
                          // Twitter sign-in logic
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Sign up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account? ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignupPage()),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: AppColors.pcolor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable Social Media Button
  Widget _buildSocialButton(String assetPath, VoidCallback onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(assetPath),
        iconSize: 24,
      ),
    );
  }
}
