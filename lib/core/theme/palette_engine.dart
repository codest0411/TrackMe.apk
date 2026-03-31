// lib/core/theme/palette_engine.dart
import 'package:flutter/material.dart';

enum AppThemePalette {
  midnight, // dark navy + electric blue
  ember, // dark + orange/red gradient
  forest, // deep green + mint
  arctic, // pure white + ice blue
  roseGold, // warm neutrals + rose
  voidMode, // pure black + neon purple
}

class AppPalette {
  final Color background;
  final Color cardBackground;
  final Color primary;
  final Color accent;
  final List<Color> primaryGradient;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Brightness brightness;

  const AppPalette({
    required this.background,
    required this.cardBackground,
    required this.primary,
    required this.accent,
    required this.primaryGradient,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.brightness,
  });

  static AppPalette getPalette(AppThemePalette theme) {
    switch (theme) {
      case AppThemePalette.midnight:
        return const AppPalette(
          background: Color(0xFF0A0E21),
          cardBackground: Color(0xFF1D1E33),
          primary: Color(0xFF4C8CFF),
          accent: Color(0xFF00E5FF),
          primaryGradient: [
            Color(0xFF4C8CFF),
            Color(0xFF00E5FF)
          ],
          textPrimary: Colors.white,
          textSecondary: Colors.white70,
          border: Colors.white12,
          brightness: Brightness.dark,
        );
      case AppThemePalette.ember:
        return const AppPalette(
          background: Color(0xFF120B0B),
          cardBackground: Color(0xFF1E1414),
          primary: Color(0xFFF94C10),
          accent: Color(0xFFFFCC00),
          primaryGradient: [
            Color(0xFFF94C10),
            Color(0xFFFFCC00)
          ],
          textPrimary: Colors.white,
          textSecondary: Colors.white70,
          border: Colors.white10,
          brightness: Brightness.dark,
        );
      case AppThemePalette.forest:
        return const AppPalette(
          background: Color(0xFF0C140C),
          cardBackground: Color(0xFF172417),
          primary: Color(0xFF2ECC71),
          accent: Color(0xFFD5F5E3),
          primaryGradient: [
            Color(0xFF2ECC71),
            Color(0xFF1ABC9C)
          ],
          textPrimary: Colors.white,
          textSecondary: Colors.white70,
          border: Colors.white10,
          brightness: Brightness.dark,
        );
      case AppThemePalette.arctic:
        return const AppPalette(
          background: Color(0xFFF0F4F8),
          cardBackground: Colors.white,
          primary: Color(0xFF3498DB),
          accent: Color(0xFF00C6FF),
          primaryGradient: [
            Color(0xFF3498DB),
            Color(0xFF00C6FF)
          ],
          textPrimary: Color(0xFF2C3E50),
          textSecondary: Color(0xFF7F8C8D),
          border: Color(0xFFE5E8E8),
          brightness: Brightness.light,
        );
      case AppThemePalette.roseGold:
        return const AppPalette(
          background: Color(0xFFFFF5F5),
          cardBackground: Color(0xFFFFFFFF),
          primary: Color(0xFFE67EAD),
          accent: Color(0xFFFFC0CB),
          primaryGradient: [
            Color(0xFFE67EAD),
            Color(0xFFFFC0CB)
          ],
          textPrimary: Color(0xFF4A4A4A),
          textSecondary: Color(0xFF8E8E8E),
          border: Color(0xFFFADBD8),
          brightness: Brightness.light,
        );
      case AppThemePalette.voidMode:
        return const AppPalette(
          background: Colors.black,
          cardBackground: Color(0xFF121212),
          primary: Color(0xFFBB86FC),
          accent: Color(0xFFCF6679),
          primaryGradient: [
            Color(0xFFBB86FC),
            Color(0xFF9965F4)
          ],
          textPrimary: Colors.white,
          textSecondary: Colors.white60,
          border: Colors.white10,
          brightness: Brightness.dark,
        );
    }
  }
}
