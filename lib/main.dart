// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  // Initialize services (Simplified for prototype)
  // In a real app we'd await StorageService.init() and NotificationService.init()
  
  runApp(
    const ProviderScope(
      child: TrackMeApp(),
    ),
  );
}

class TrackMeApp extends ConsumerWidget {
  const TrackMeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final currentPalette = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'TrackMe',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.getTheme(currentPalette),
      // App starts with Splash / Onboarding via initialLocation in go_router
    );
  }
}
