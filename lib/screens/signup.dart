import 'package:flutter/material.dart';
import 'package:technest/blocks/colors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Handle back navigation
                  },
                ),
              ),
              const SizedBox(height: 40),

              // Logo
              Center(
                child: Image.asset(
                  'assets/file.png', // Replace with your logo asset path
                  width: 100,
                ),
              ),
              const SizedBox(height: 10),

              // Sign-up Form Container
              Container(
                padding: const EdgeInsets.all(24.0),
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
                    // Title
                    const Text(
                      'Create your Account',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Email TextField
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),

                    // Password TextField
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: AppColors.tcolor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password TextField
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        filled: true,
                        fillColor: AppColors.tcolor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),

                    // Sign up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle sign-up logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade800,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Or sign up with
                    const Text(
                      '- Or sign up with -',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // Social Media Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton('assets/google.png', () {
                          // Google sign-up logic here
                        }),
                        const SizedBox(width: 16),
                        _buildSocialButton('assets/facebook.png', () {
                          // Facebook sign-up logic here
                        }),
                        const SizedBox(width: 16),
                        _buildSocialButton('assets/twitter.png', () {
                          // Twitter sign-up logic here
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Social media button builder
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
