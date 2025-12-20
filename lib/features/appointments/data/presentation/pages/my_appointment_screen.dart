// lib/features/appointments/presentation/pages/my_appointment_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_demo_proj/core/theme/app_colors.dart';
import 'widgets/appointment_card.dart';

class MyAppointmentScreen extends StatefulWidget {
  const MyAppointmentScreen({super.key});

  @override
  State<MyAppointmentScreen> createState() => _MyAppointmentScreenState();
}

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {
  bool isUpcomingSelected = true;

  @override
  Widget build(BuildContext context) {
    // Check if we can pop to show the back button only when needed
    GoRouter.of(context).canPop();
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        title: const Text("My Appointment", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Custom Toggle Tab
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                _tabButton("Up Coming(02)", isUpcomingSelected, () {
                  setState(() => isUpcomingSelected = true);
                }),
                const SizedBox(width: 12),
                _tabButton("Completed", !isUpcomingSelected, () {
                  setState(() => isUpcomingSelected = false);
                }),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: isUpcomingSelected ? _buildUpcomingList() : _buildCompletedList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabButton(String label, bool isActive, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : const Color(0xFFE8F0FF),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildUpcomingList() {
    return const [
      AppointmentCard(
        doctorName: "Dr. Joynal Abedin",
        specialty: "Podiatric Surgery",
        date: "Nov 25, 2025",
        time: "10:30 am",
        type: "Physical",
        status: "Confirmed",
        isUpcoming: true,
      ),
      AppointmentCard(
        doctorName: "Dr. Joynal Abedin",
        specialty: "Podiatric Surgery",
        date: "Nov 25, 2025",
        time: "10:30 am",
        type: "Video",
        status: "Pending",
        isUpcoming: true,
      ),
      AppointmentCard(
        doctorName: "Dr. Joynal Abedin",
        specialty: "Podiatric Surgery",
        date: "Nov 25, 2025",
        time: "10:30 am",
        type: "Video",
        status: "Pending",
        isUpcoming: true,
      ),
    ];
  }

  List<Widget> _buildCompletedList() {
    return const [
      AppointmentCard(
        doctorName: "Dr. Joynal Abedin",
        specialty: "Podiatric Surgery",
        date: "Nov 25, 2025",
        time: "10:30 am",
        type: "Physical",
        status: "Completed",
        isUpcoming: false,
      ),
      AppointmentCard(
        doctorName: "Dr. Joynal Abedin",
        specialty: "Podiatric Surgery",
        date: "Nov 25, 2025",
        time: "10:30 am",
        type: "Video",
        status: "Completed",
        isUpcoming: false,
      ),
       AppointmentCard(
        doctorName: "Dr. Joynal Abedin",
        specialty: "Podiatric Surgery",
        date: "Nov 25, 2025",
        time: "10:30 am",
        type: "Physical",
        status: "Completed",
        isUpcoming: false,
      ),
    ];
  }
}