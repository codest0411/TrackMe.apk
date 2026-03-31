// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'palette_engine.dart';

final themeProvider = StateProvider<AppThemePalette>((ref) => AppThemePalette.midnight);

class AppTheme {
  static ThemeData getTheme(AppThemePalette currentPaletteType) {
    final palette = AppPalette.getPalette(currentPaletteType);
    
    return ThemeData(
      useMaterial3: true,
      brightness: palette.brightness,
      scaffoldBackgroundColor: palette.background,
      primaryColor: palette.primary,
      cardColor: palette.cardBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: palette.primary,
        brightness: palette.brightness,
        surface: palette.background,
        onSurface: palette.textPrimary,
        primary: palette.primary,
        secondary: palette.accent,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
        displayLarge: GoogleFonts.syne(
          color: palette.textPrimary,
          fontWeight: FontWeight.w800,
          fontSize: 32,
        ),
        headlineMedium: GoogleFonts.syne(
          color: palette.textPrimary,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          color: palette.textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(
          color: palette.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          color: palette.textSecondary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: palette.textPrimary),
        titleTextStyle: GoogleFonts.syne(
          color: palette.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        color: palette.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: palette.border, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: palette.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          elevation: 0,
        ),
      ),
    );
  }
}

// Extensions for easy access to custom theme properties
extension ThemeX on BuildContext {
  AppPalette get palette => AppPalette.getPalette(ProviderScope.containerOf(this).read(themeProvider));
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}
