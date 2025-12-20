// lib/features/appointments/presentation/widgets/time_slot_grid.dart
import 'package:flutter/material.dart';
import 'package:ui_demo_proj/core/theme/app_colors.dart';

class TimeSlotGrid extends StatelessWidget {
  const TimeSlotGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _buildTimeTile("10:00 Am", "10:30 Am", false),
        _buildTimeTile("10:31 Am", "11:00 Am", false),
        _buildTimeTile("11:01 Am", "11:30 Am", true), // Selected example
        _buildTimeTile("11:31 Am", "12:00 Am", false),
        _buildTimeTile("12:10 Am", "12:40 Am", false),
      ],
    );
  }

  Widget _buildTimeTile(String start, String end, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isSelected ? AppColors.primary : Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(start, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 11)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text("To", style: TextStyle(color: isSelected ? Colors.white70 : Colors.grey, fontSize: 10)),
          ),
          Text(end, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 11)),
        ],
      ),
    );
  }
}