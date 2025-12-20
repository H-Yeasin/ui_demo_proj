// lib/features/reels/presentation/pages/reels_player_screen.dart
import 'package:flutter/material.dart';
import 'package:ui_demo_proj/features/reels/presentation/pages/data/models/reel_model.dart';

class ReelsPlayerScreen extends StatefulWidget {
  final int initialIndex;
  const ReelsPlayerScreen({super.key, required this.initialIndex});

  @override
  State<ReelsPlayerScreen> createState() => _ReelsPlayerScreenState();
}

class _ReelsPlayerScreenState extends State<ReelsPlayerScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical, // This creates the TikTok scroll
        controller: _pageController,
        itemCount: dummyReels.length,
        itemBuilder: (context, index) {
          final reel = dummyReels[index];
          return Stack(
            children: [
              // Immersive Background
              Positioned.fill(
                child: Image.asset(reel.videoPath, fit: BoxFit.cover),
              ),
              
              // Dark UI Overlays (Reused from previous code)
              _buildInteractionUI(reel),
              
              // Back Button
              Positioned(
                top: 50,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInteractionUI(ReelModel reel) {
    return Stack(
      children: [
        // Side Buttons
        Positioned(
          right: 16,
          bottom: 100,
          child: Column(
            children: [
              _buildActionItem(Icons.favorite_border, reel.likes),
              const SizedBox(height: 24),
              _buildActionItem(Icons.bookmark_border, "Save"),
            ],
          ),
        ),
        // Bottom Info
        Positioned(
          left: 16,
          bottom: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(reel.doctorName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(reel.title, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 32),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}