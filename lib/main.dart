// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const ProviderScope(child: TrackMeApp()));
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
      theme: AppTheme.getTheme(currentPalette),
      routerConfig: router,
      builder: (context, child) {
        // Enforce Professional Mobile Scaling
        return Container(
          color: Colors.black,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 450),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.blueAccent.withValues(alpha: 0.1), blurRadius: 100, spreadRadius: 10),
                ],
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
