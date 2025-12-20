import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common_widgets/auth_header.dart';
import '../../../../core/common_widgets/custom_text_field.dart';
import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Reusable Auth Header for Sign Up
              const AuthHeader(
                title: "Create Account",
                subtitle: "Please Signup to your Account",
              ),
              const SizedBox(height: 32),
              
              // Full Name Field
              const CustomTextField(
                label: "Full Name",
                hint: "The king",
              ),
              const SizedBox(height: 16),
              
              // Email Address Field
              const CustomTextField(
                label: "Email Address",
                hint: "you@gmail.com",
              ),
              const SizedBox(height: 16),
              
              // Password Field
              const CustomTextField(
                label: "Password",
                hint: "••••••••••••",
                isPassword: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              
              // Confirm Password Field
              const CustomTextField(
                label: "Confirm Password",
                hint: "••••••••••••",
                isPassword: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              
              // Create Account Button with Person Icon
              PrimaryButton(
                label: "Create Account",
                icon: Icons.person_outline,
                onPressed: () {
                  // Logic for registration
                },
              ),
              const SizedBox(height: 24),
              
              // Footer Navigation back to Sign In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () => context.go('/login'),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}