// lib/features/home/presentation/pages/home_doctor_screen.dart
import 'package:flutter/material.dart';

class HomeDoctorScreen extends StatelessWidget {
  const HomeDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/dr_king.png'), // Dr.The king
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Dr.The king", 
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Podiatric Surgery", 
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none, color: Colors.black)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Create a Post Section
            _buildCreatePostCard(),
            const SizedBox(height: 20),
            // Social Feed Post
            _buildSocialPostCard(),
            const SizedBox(height: 16),
             _buildSocialPostCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatePostCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.shade50),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 18, backgroundImage: AssetImage('assets/images/user_thumb.png')),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("Share your insights with follow doctors...", 
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _postOption(Icons.image_outlined, "Photo"),
              _postOption(Icons.videocam_outlined, "Video"),
              _postOption(Icons.play_circle_outline, "Reels"),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6C63FF),
                  side: const BorderSide(color: Color(0xFF6C63FF)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                ),
                child: const Text("Create a Post"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _postOption(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildSocialPostCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(backgroundImage: AssetImage('assets/images/dr_joynal.png')),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. Joynal Abedin", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("16h ago", style: TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text("A core principle of patient centered and compassionate care", 
            style: TextStyle(fontSize: 13)),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/images/post_image.png', fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _interactionBtn(Icons.thumb_up_alt_outlined, "792"),
              const SizedBox(width: 8),
              _interactionBtn(Icons.chat_bubble_outline, "792"),
              const Spacer(),
              _interactionBtn(Icons.share_outlined, "12"),
            ],
          )
        ],
      ),
    );
  }

  Widget _interactionBtn(IconData icon, String count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F5FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF6C63FF)),
          const SizedBox(width: 4),
          Text(count, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}