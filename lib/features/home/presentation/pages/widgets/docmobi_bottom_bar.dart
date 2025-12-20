// lib/features/home/presentation/widgets/docmobi_bottom_bar.dart
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class DocmobiBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const DocmobiBottomBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), activeIcon: Icon(Icons.calendar_month), label: 'Appointments'),
        BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline), label: 'Reels'),
        BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}