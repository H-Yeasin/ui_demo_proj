// lib/features/appointments/presentation/widgets/appointment_type_selector.dart
import 'package:flutter/material.dart';
import 'package:ui_demo_proj/core/theme/app_colors.dart';
import 'package:ui_demo_proj/features/appointments/data/appointment_type.dart';

class AppointmentTypeSelector extends StatelessWidget {
  final AppointmentType selectedType;
  final Function(AppointmentType) onChanged;

  const AppointmentTypeSelector({super.key, required this.selectedType, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTypeCard(
          title: "Physical Visit",
          subtitle: "Pay at Clinic",
          icon: Icons.local_hospital_outlined,
          isActive: selectedType == AppointmentType.physical,
          onTap: () => onChanged(AppointmentType.physical),
        ),
        const SizedBox(width: 16),
        _buildTypeCard(
          title: "Video Call",
          subtitle: "Online Payment",
          icon: Icons.videocam_outlined,
          isActive: selectedType == AppointmentType.video,
          onTap: () => onChanged(AppointmentType.video),
        ),
      ],
    );
  }

  Widget _buildTypeCard({required String title, required String subtitle, required IconData icon, required bool isActive, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isActive ? AppColors.primary : Colors.grey.shade200, width: 2),
          ),
          child: Column(
            children: [
              Icon(icon, color: isActive ? AppColors.primary : Colors.grey, size: 32),
              const SizedBox(height: 8),
              Text(title, style: TextStyle(color: isActive ? AppColors.primary : Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}