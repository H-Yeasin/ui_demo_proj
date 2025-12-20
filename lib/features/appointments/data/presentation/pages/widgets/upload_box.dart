// lib/features/appointments/presentation/widgets/upload_box.dart
import 'package:flutter/material.dart';

class UploadBox extends StatelessWidget {
  final String label;
  const UploadBox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100, style: BorderStyle.solid), // Use a dashed border package for "pixel perfect" dotted lines
      ),
      child: Column(
        children: [
          const Icon(Icons.cloud_upload_outlined, color: Colors.grey, size: 32),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }
}