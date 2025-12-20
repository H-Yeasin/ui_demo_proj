import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> _contents = [
    OnboardingModel(
      image: 'assets/onboarding/image1.png',
      title: "Find Doctor Near You",
      description: "Find a doctor and make appointments with them as you wish",
    ),
    OnboardingModel(
      image: 'assets/onboarding/image2.png',
      title: "live consultation with expert doctors",
      description: "Connect Live for Expert and Receive accurate medical recommendations in real time.",
    ),
    OnboardingModel(
      image: 'assets/onboarding/image3.png',
      title: "Book an Appointment",
      description: "Find the right doctor and confirm your appointment instantly.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => context.push('/select-profile'),
                child: const Text("Skip", style: TextStyle(color: Colors.grey)),
              ),
            ),
            
            // Image and Text Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _contents.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(_contents[index].image, height: 300),
                        const SizedBox(height: 40),
                        Text(
                          _contents[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24,color: AppColors.textMain ,fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _contents[index].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Dot Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _contents.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentIndex == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? AppColors.primary : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 40),

            // Next Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: PrimaryButton(
                label: "Next",
                onPressed: () {
                  if (_currentIndex == _contents.length - 1) {
                    context.push('/select-profile');
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

