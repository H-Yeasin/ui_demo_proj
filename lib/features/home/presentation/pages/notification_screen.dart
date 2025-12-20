// lib/features/home/presentation/pages/notification_screen.dart
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text("Notification", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          // "1 New" badge style
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: const Text("1 New", style: TextStyle(color: Colors.white, fontSize: 12)),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text("New", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildNotificationItem(
            title: "Appointment Success",
            desc: "You have successfully booked your appointment with Dr. Joynal Abedin",
            time: "1h",
            icon: Icons.calendar_today,
            iconColor: Colors.blue,
            isNew: true,
          ),
          const SizedBox(height: 32),
          const Text("Earlier", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildNotificationItem(
            title: "Schedule Changed",
            desc: "You have successfully changed your appointment with Dr. Joynal Abedin",
            time: "2h",
            icon: Icons.edit_calendar,
            iconColor: Colors.orange,
          ),
          _buildNotificationItem(
            title: "Appointment Cancelled",
            desc: "You have successfully cancelled your appointment with Dr. Joynal Abedin",
            time: "5h",
            icon: Icons.cancel_presentation_outlined,
            iconColor: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String desc,
    required String time,
    required IconData icon,
    required Color iconColor,
    bool isNew = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isNew ? AppColors.primary.withOpacity(0.05) : const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(16),
        border: isNew ? Border.all(color: AppColors.primary.withOpacity(0.1)) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Colors.black54, fontSize: 13, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}