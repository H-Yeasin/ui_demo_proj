import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common_widgets/auth_header.dart';
import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                title: "OTP",
                subtitle: "We have sent the verification code to your email address",
              ),
              const SizedBox(height: 40),
              
              // 4-Digit OTP Input Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _OtpBox(first: true, last: false),
                  _OtpBox(first: false, last: false),
                  _OtpBox(first: false, last: false),
                  _OtpBox(first: false, last: true),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Resend Timer/Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't get the code? ", style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () {
                      // Handle Resend Logic
                    },
                    child: const Text(
                      "Resend it",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              PrimaryButton(
                label: "Continue",
                onPressed: () => context.push('/reset-password'),
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  final bool first;
  final bool last;
  const _OtpBox({required this.first, required this.last});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 64,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: AppColors.primary),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: AppColors.primary),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}