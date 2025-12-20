import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/logo.png', height: 200, fit: BoxFit.contain,), // Replace with your logo asset
        Text(title, style: AppTextStyles.h1),
        const SizedBox(height: 6),
        Text(subtitle, style: AppTextStyles.body, textAlign: TextAlign.center),
      ],
    );
  }
}