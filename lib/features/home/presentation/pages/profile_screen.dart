// lib/features/home/presentation/pages/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_demo_proj/features/home/presentation/pages/widgets/profile_menu_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/home-patient'),
        ),
        title: const Text("My Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/home/user_large.png'),
            ),
            const SizedBox(height: 12),
            const Text("The king", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("Koln - Germany", style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 32),

            ProfileMenuTile(
              icon: Icons.person_outline,
              title: "Personal Info",
              onTap: () => context.push('/personal-info'), // Navigation added
            ),
            ProfileMenuTile(
              icon: Icons.calendar_today_outlined,
              title: "My Appointment",
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.favorite_border,
              title: "My Wishlist",
              onTap: () {},
            ),
            ProfileMenuTile(
              icon: Icons.language,
              title: "Language",
              onTap: () {},
              trailing: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("English", style: TextStyle(color: Colors.grey)),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),
            ),
            ProfileMenuTile(
              icon: Icons.headset_mic_outlined,
              title: "Help & Support",
              onTap: () {},
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.go('/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.white),
                    SizedBox(width: 8),
                    Text("Log Out", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}