import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_demo_proj/features/appointments/data/presentation/pages/book_appointment_screen.dart';
import 'package:ui_demo_proj/features/appointments/data/presentation/pages/my_appointment_screen.dart';
import 'package:ui_demo_proj/features/auth/presentation/pages/doctor_signup_screen.dart';
import 'package:ui_demo_proj/features/home/presentation/pages/notification_screen.dart';
import 'package:ui_demo_proj/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:ui_demo_proj/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:ui_demo_proj/features/auth/presentation/pages/otp_screen.dart';
import 'package:ui_demo_proj/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:ui_demo_proj/features/auth/presentation/pages/signup_screen.dart';
import 'package:ui_demo_proj/features/auth/presentation/pages/splash_screen.dart';
import 'package:ui_demo_proj/features/home/presentation/pages/home_patient_screen.dart';
import 'package:ui_demo_proj/features/auth/presentation/pages/login_screen.dart';
import 'package:ui_demo_proj/features/auth/presentation/pages/select_profile_screen.dart';
import 'package:ui_demo_proj/features/home/presentation/pages/main_wrapper.dart';
import 'package:ui_demo_proj/features/home/presentation/pages/personal_info_screen.dart';
import 'package:ui_demo_proj/features/home/presentation/pages/profile_screen.dart';
import 'package:ui_demo_proj/features/home/presentation/pages/widgets/home_doctor_screen.dart';
import 'package:ui_demo_proj/features/messages/presentation/pages/chat_screen.dart';
import 'package:ui_demo_proj/features/messages/presentation/pages/message_list_screen.dart';
import 'package:ui_demo_proj/features/reels/presentation/pages/reels_grid_screen.dart';
import 'package:ui_demo_proj/features/reels/presentation/pages/reels_player_screen.dart';

import 'core/theme/app_theme.dart';

class DocmobiApp extends StatelessWidget {
  const DocmobiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Docmobi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: _router,
    );
  }

  // Navigator keys for ShellRoute
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      // --- Auth Routes (No Bottom Bar) ---
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingScreen()),
      GoRoute(path: '/select-profile', builder: (context, state) => const SelectProfileScreen()),
      GoRoute(path: '/login', builder: (context, state) {
        // Extract the role passed via 'extra'. Default to 'patient' if null.
        final userRole = state.extra as String? ?? 'patient';
        return LoginScreen(userRole: userRole);

      }),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpScreen()),
      GoRoute(path: '/forgot-password', builder: (context, state) => const ForgotPasswordScreen()),
      GoRoute(path: '/otp', builder: (context, state) => const OtpScreen()),
      GoRoute(path: '/reset-password', builder: (context, state) => const ResetPasswordScreen()),
      GoRoute(path: '/notifications', builder: (context, state) => const NotificationScreen()),
      GoRoute(path:  '/book_appointment', builder: (context, state) => const BookAppointmentScreen()),

      // --- Main App Routes (With Bottom Bar) ---
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainWrapper(child: child); // Persistent Bottom Bar
        },
        routes: [
          GoRoute(
            path: '/home-patient',
            builder: (context, state) => const HomePatientScreen(), //
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(), //
          ),
          GoRoute(
            path: '/personal-info',
            builder: (context, state) => const PersonalInfoScreen(),
          ),
          GoRoute(
            path: '/reels',
            builder: (context, state) => const ReelsGridScreen(),
          ),
          GoRoute(
            path: '/reels/player',
            builder: (context, state) {
            final startIndex = state.extra as int? ?? 0;
            return ReelsPlayerScreen(initialIndex: startIndex);
            },
          ),
          GoRoute(
            path: '/messages',
            builder: (context, state) => const MessageListScreen(),
          ),
          GoRoute(
            path: '/messages/chat',
            builder: (context, state) => const ChatScreen(),
          ),
          GoRoute(
            path: '/home-doctor',
            builder: (context, state) => const HomeDoctorScreen(),
          ),

          // Outside ShellRoute (Full Screen - No Bottom Bar for Immersive Feel)
          // Placeholders for other tabs
          GoRoute(path: '/appointments', builder: (context, state) => const MyAppointmentScreen()),
        ],
      ),
      GoRoute(path: '/doctor-signup', builder: (context, state) => const DoctorSignUpScreen()),
      GoRoute(path: '/home-doctor', builder: (context, state) => const HomePatientScreen()), 
    ],
  );
}