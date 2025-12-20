import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common_widgets/auth_header.dart';
import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const AuthHeader(
                title: "Forgot Password",
                subtitle: "Select which contact details should we use to reset your password",
              ),
              const SizedBox(height: 32),
              
              // Selection Card for Email
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary, width: 2),
                  color: AppColors.primary.withOpacity(0.05),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primary.withOpacity(0.1),
                      child: const Icon(Icons.email_outlined, color: AppColors.primary),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("via Email:", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text("gdg***fsf@aziotv.com", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              PrimaryButton(
                label: "Continue",
                onPressed: () => context.push('/otp'),
              ),
              
              const SizedBox(height: 24),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Remember Password "),
                  GestureDetector(
                    onTap: () => context.go('/login'),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: AppColors.primary, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
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