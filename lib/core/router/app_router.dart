// lib/core/router/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/steps/steps_screen.dart';
import '../../features/workout/workout_screen.dart';
import '../../features/timer/timer_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/wellness/wellness_screen.dart';
import '../../features/nutrition/nutrition_screen.dart';
import '../../features/social/social_screen.dart';
import '../../features/ai_coach/ai_coach_screen.dart';
import '../../shared/widgets/nav_bar.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingScreen()),
      ShellRoute(
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(path: '/', builder: (context, state) => const DashboardScreen()),
          GoRoute(path: '/steps', builder: (context, state) => const StepsScreen()),
          GoRoute(path: '/workout', builder: (context, state) => const WorkoutScreen()),
          GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen()),
          GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
          GoRoute(path: '/wellness', builder: (context, state) => const WellnessScreen()),
          GoRoute(path: '/nutrition', builder: (context, state) => const NutritionScreen()),
          GoRoute(path: '/social', builder: (context, state) => const SocialScreen()),
          GoRoute(path: '/ai_coach', builder: (context, state) => const AICoachScreen()),
          GoRoute(path: '/timer', builder: (context, state) => const TimerScreen()),
        ],
      ),
    ],
  );
});
