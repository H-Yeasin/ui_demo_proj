// lib/features/home/presentation/widgets/profile_menu_tile.dart
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF), // Light blue tint from design
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: AppColors.textMain, size: 22),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      ),
    );
  }
}