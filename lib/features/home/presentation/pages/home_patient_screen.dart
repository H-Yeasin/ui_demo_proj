// lib/features/home/presentation/pages/home_patient_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/widgets/doctor_card.dart';


class HomePatientScreen extends StatelessWidget {
  const HomePatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF), // Subtle blue background from Figma
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
  children: [
    const CircleAvatar(
      backgroundImage: AssetImage('assets/home/user.png'),
    ),
    const SizedBox(width: 12),
    
    InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        context.push('/profile'); // Navigate to profile screen
      },
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The king",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            children: [
              Icon(Icons.location_on, size: 14, color: Colors.grey),
              Text(
                " Koln - Germany",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    ),

    const Spacer(),
    
    IconButton(
      onPressed: () => context.push('/notifications'),
      icon: const Icon(Icons.notifications_none_outlined),
    ),
  ],
),
              const SizedBox(height: 20),
              
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Doctor...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 20),
              
              // Map/Location Card Placeholder (as seen in design)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/home/map_preview.png'),
              ),
              const SizedBox(height: 20),
              
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nearby Doctor's", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 16),
              Column(
              children: List.generate(6,
              (index) => const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: DoctorCard(),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}