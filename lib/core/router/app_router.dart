// lib/core/router/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/steps/steps_screen.dart';
import '../../features/workout/workout_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/timer/timer_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../shared/widgets/nav_bar.dart'; // Corrected import

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/steps',
            builder: (context, state) => const StepsScreen(),
          ),
          GoRoute(
            path: '/workout',
            builder: (context, state) => const WorkoutScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/timer',
            builder: (context, state) => const TimerScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
});
