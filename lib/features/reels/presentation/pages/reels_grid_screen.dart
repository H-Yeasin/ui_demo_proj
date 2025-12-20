// lib/features/reels/presentation/pages/reels_grid_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_demo_proj/features/reels/presentation/pages/data/models/reel_model.dart';

class ReelsGridScreen extends StatelessWidget {
  const ReelsGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/home-patient'),
        ),
        title: const Text("Reels", 
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.72, // Matches the portrait ratio in your Figma screen
        ),
        itemCount: dummyReels.length,
        itemBuilder: (context, index) {
          final reel = dummyReels[index];
          return GestureDetector(
            onTap: () => context.push('/reels/player', extra: index),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(reel.thumbnailPath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Row(
                      children: [
                        const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 18),
                        const SizedBox(width: 4),
                        Text(reel.views, 
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}