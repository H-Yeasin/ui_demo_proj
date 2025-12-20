// lib/features/home/presentation/pages/personal_info_screen.dart
import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text("Personal Info", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Edit Your Profile", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/user_large.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Icon(Icons.camera_alt, size: 20, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Center(child: Text("Tap to Change your Profile Picture", style: TextStyle(fontSize: 12, color: Colors.grey))),
            const SizedBox(height: 32),
            
            _buildEditField(label: "The King", icon: Icons.person_outline),
            _buildEditField(label: "example@gmail.com", icon: Icons.email_outlined),
            _buildEditField(label: "Phone Number", icon: Icons.phone_outlined),
            _buildEditField(label: "Change Password", icon: Icons.lock_outline),
            _buildEditField(label: "Address", icon: Icons.location_on_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildEditField({required String label, required IconData icon}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.black54),
        title: Text(label, style: const TextStyle(fontSize: 15)),
        trailing: const Icon(Icons.edit_outlined, size: 20, color: Colors.black54),
      ),
    );
  }
}