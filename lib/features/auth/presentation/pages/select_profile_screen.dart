import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';

class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({super.key});

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  bool isPatient = true; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "Select Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: _ProfileCard(
                      title: 'Patient',
                      image: "assets/onboarding/patient_avatar.png", // Replace with your asset
                      isSelected: isPatient,
                      onTap: () => setState(() => isPatient = true),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _ProfileCard(
                      title: "Doctor",
                      image: "assets/onboarding/doctor_avatar.png", // Replace with your asset
                      isSelected: !isPatient,
                      onTap: () => setState(() => isPatient = false),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                label: "Continue",
                onPressed: () {
                  // If it's a doctor, we might want to go to a specific doctor-login 
                  // or pass a parameter to the login screen.
                  context.push('/login', extra: isPatient ? 'patient' : 'doctor');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String title;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const _ProfileCard({
    required this.title,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade200,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Image.asset(image, height: 100), // Placeholders from design
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors.primary : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}