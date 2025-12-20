// lib/features/home/presentation/pages/main_wrapper.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_demo_proj/features/home/presentation/pages/widgets/docmobi_bottom_bar.dart';

class MainWrapper extends StatelessWidget {
  final Widget child;
  const MainWrapper({super.key, required this.child});

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home-patient')|| location.startsWith('/home-doctor') ) return 0;
    if (location.startsWith('/appointments')) return 1;
    if (location.startsWith('/reels')) return 2;
    if (location.startsWith('/messages')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context, String userRole) {
    switch (index) {
      case 0: userRole == 'doctor' ? context.go('/home-doctor') : context.go('/home-patient');
      break;
      case 1: context.go('/appointments'); break;
      case 2: context.go('/reels'); break;
      case 3: context.go('/messages'); break;
      case 4: context.go('/profile'); break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is the ONLY place the BottomBar should exist
      body: child, 
      bottomNavigationBar: DocmobiBottomBar(
        currentIndex: _getSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context, 'patient'), // Defaulting to 'patient'; adjust as needed
      ),
    );
  }
}