// lib/features/auth/presentation/pages/doctor_signup_screen.dart
import 'package:flutter/material.dart';
import '../../../../core/common_widgets/primary_button.dart';

class DoctorSignUpScreen extends StatelessWidget {
  const DoctorSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(child: Image.asset('assets/logo.png', height: 160, width: 160)), // Logo at the top
            const SizedBox(height: 20),
            const Text("Create Account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("Please Signup to your Account", style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 30),
            
            _buildTextField("Full Name", "The king"),
            _buildTextField("Email Address", "you@gmail.com"),
            _buildTextField("Medical License Number", "1111 1111 2222 33333"),
            
            // Specialty Dropdown
            _buildDropdownField("Medical Specialty*", "Add your specialty"),
            
            _buildTextField("How many years of experience?", "05 Years"),
            _buildTextField("Password", "••••••••••••", isPassword: true),
            _buildTextField("Confirm Password", "••••••••••••", isPassword: true),
            
            const SizedBox(height: 30),
            PrimaryButton(
              label: "Create Account", 
              onPressed: () {
                 // Trigger the "Waiting for Approval" Modal
                 _showApprovalModal(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          const SizedBox(height: 8),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: isPassword ? const Icon(Icons.visibility_off_outlined, size: 20) : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(hint, style: const TextStyle(fontSize: 14)),
                items: const [], // Add specialties here
                onChanged: (val) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showApprovalModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 50),
            const SizedBox(height: 16),
            const Text("Waiting For Approval", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            const Text("Please wait while we verify your submission.", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}