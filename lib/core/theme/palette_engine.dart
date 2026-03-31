// lib/core/theme/palette_engine.dart
import 'package:flutter/material.dart';

enum AppThemePalette { midnight, ember, forest, arctic, roseGold, voidTheme }

class AppPalette {
  final Color primary;
  final Color background;
  final Color cardBackground;
  final Color textPrimary;
  final Color textSecondary;
  final Color accent;
  final Color border;
  final List<Color> primaryGradient;
  final Brightness brightness;

  const AppPalette({
    required this.primary,
    required this.background,
    required this.cardBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.accent,
    required this.border,
    required this.primaryGradient,
    required this.brightness,
  });

  static AppPalette getPalette(AppThemePalette palette, {Color? customAccent}) {
    switch (palette) {
      case AppThemePalette.midnight:
        return AppPalette(
          primary: customAccent ?? const Color(0xFF6366F1),
          background: const Color(0xFF0F172A),
          cardBackground: const Color(0xFF1E293B),
          textPrimary: Colors.white,
          textSecondary: Colors.white70,
          accent: const Color(0xFF38BDF8),
          border: Colors.white10,
          primaryGradient: [const Color(0xFF6366F1), const Color(0xFF38BDF8)],
          brightness: Brightness.dark,
        );
      case AppThemePalette.ember:
        return AppPalette(
          primary: customAccent ?? const Color(0xFFFF5F6D),
          background: const Color(0xFF1E1E1E),
          cardBackground: const Color(0xFF2D2D2D),
          textPrimary: Colors.white,
          textSecondary: Colors.white60,
          accent: const Color(0xFFFFC371),
          border: Colors.white10,
          primaryGradient: [const Color(0xFFFF5F6D), const Color(0xFFFFC371)],
          brightness: Brightness.dark,
        );
      case AppThemePalette.forest:
        return AppPalette(
          primary: customAccent ?? const Color(0xFF10B981),
          background: const Color(0xFF064E3B),
          cardBackground: const Color(0xFF065F46),
          textPrimary: Colors.white,
          textSecondary: Colors.white70,
          accent: const Color(0xFF34D399),
          border: Colors.white10,
          primaryGradient: [const Color(0xFF10B981), const Color(0xFF34D399)],
          brightness: Brightness.dark,
        );
      case AppThemePalette.arctic:
        return AppPalette(
          primary: customAccent ?? const Color(0xFF0EA5E9),
          background: const Color(0xFFF8FAFC),
          cardBackground: Colors.white,
          textPrimary: const Color(0xFF0F172A),
          textSecondary: const Color(0xFF475569),
          accent: const Color(0xFF7DD3FC),
          border: const Color(0xFFE2E8F0),
          primaryGradient: [const Color(0xFF0EA5E9), const Color(0xFF7DD3FC)],
          brightness: Brightness.light,
        );
      case AppThemePalette.roseGold:
        return AppPalette(
          primary: customAccent ?? const Color(0xFFE11D48),
          background: const Color(0xFF1C1917),
          cardBackground: const Color(0xFF292524),
          textPrimary: Colors.white,
          textSecondary: Colors.white60,
          accent: const Color(0xFFFB7185),
          border: Colors.white10,
          primaryGradient: [const Color(0xFFE11D48), const Color(0xFFFB7185)],
          brightness: Brightness.dark,
        );
      case AppThemePalette.voidTheme:
        return AppPalette(
          primary: customAccent ?? const Color(0xFFD946EF),
          background: Colors.black,
          cardBackground: const Color(0xFF111111),
          textPrimary: Colors.white,
          textSecondary: Colors.white70,
          accent: const Color(0xFF8B5CF6),
          border: const Color(0xFF222222),
          primaryGradient: [const Color(0xFFD946EF), const Color(0xFF8B5CF6)],
          brightness: Brightness.dark,
        );
    }
  }
}
