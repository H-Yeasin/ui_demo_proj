import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common_widgets/auth_header.dart';
import '../../../../core/common_widgets/custom_text_field.dart';
import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  final String userRole;
  const LoginScreen({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const AuthHeader(
                title: "Welcome back",
                subtitle: "Please Login to your Account",
              ),
              const SizedBox(height: 32),
              const CustomTextField(
                label: "Email Address",
                hint: "you@gmail.com",
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: "Password",
                hint: "••••••••••••",
                isPassword: true,
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (val) {}, activeColor: AppColors.primary),
                      const Text("Remember me", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  TextButton(
                    onPressed: ()=> context.push('/forgot-password'),
                    child: const Text("Forgot your password?", style: TextStyle(fontSize: 12, color: AppColors.primary)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: "Sign in",
                icon: Icons.login,
                onPressed: () {
                // Navigate to the correct home based on role
                if (userRole == 'doctor') {
                  context.go('/home-doctor');
                } else {
                  context.go('/home-patient');
                }
              },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                    if (userRole == 'doctor') {
                      context.push('/doctor-signup');
                    } else {
                      context.push('/signup');
                    }
                  },
                    child: const Text("Signup", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}