import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common_widgets/auth_header.dart';
import '../../../../core/common_widgets/custom_text_field.dart';
import '../.././../../core/common_widgets/primary_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Reusable header specifically for Reset Password
              const AuthHeader(
                title: "Reset Password",
                subtitle: "", // Design shows no subtitle for this specific screen
              ),
              const SizedBox(height: 32),
              
              // New Password Input
              const CustomTextField(
                label: "New Password",
                hint: "••••••••••••",
                isPassword: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              
              // Re-enter Password Input
              const CustomTextField(
                label: "Re- Enter Password",
                hint: "••••••••••••",
                isPassword: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
              ),
              
              const SizedBox(height: 48),
              
              // Continue button to finalize the process
              PrimaryButton(
                label: "Continue",
                onPressed: () {
                  // Finalize password reset and navigate to login
                  context.go('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}