// lib/features/settings/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/palette_engine.dart';
import '../../core/theme/app_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPalette = ref.watch(themeProvider);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Preferences')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _section('APPEARANCE'),
            _buildThemeGrid(context, ref, currentPalette),
            const SizedBox(height: 32),
            _section('NOTIFICATIONS'),
            _switch(context, 'Daily Reminders', true),
            _switch(context, 'Step Goal Alerts', true),
            _switch(context, 'Workout Notifications', false),
            const SizedBox(height: 32),
            _section('ACCOUNT & PRIVACY'),
            _link('Export Data (PDF/CSV)', Icons.file_download),
            _link('Storage Management', Icons.storage),
            _link('Privacy Settings', Icons.security),
            const SizedBox(height: 48),
            Center(child: Text('TrackMe Premium v1.0.0', style: TextStyle(color: Colors.white.withOpacity(0.2), fontSize: 12))),
          ],
        ),
      ),
    );
  }

  Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.5, color: Colors.white.withValues(alpha: 0.3))),
    );
  }

  Widget _buildThemeGrid(BuildContext context, WidgetRef ref, AppThemePalette selected) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.2),
      itemCount: AppThemePalette.values.length,
      itemBuilder: (context, index) {
        final paletteType = AppThemePalette.values[index];
        final palette = AppPalette.getPalette(paletteType);
        final bool isSelected = selected == paletteType;

        return GestureDetector(
          onTap: () => ref.read(themeProvider.notifier).state = paletteType,
          child: Container(
            decoration: BoxDecoration(
              color: palette.background,
              borderRadius: BorderRadius.circular(16),
              border: isSelected ? Border.all(color: palette.primary, width: 2) : Border.all(color: Colors.white12, width: 1),
              boxShadow: isSelected ? [BoxShadow(color: palette.primary.withValues(alpha: 0.3), blurRadius: 10)] : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 24, height: 24, decoration: BoxDecoration(gradient: LinearGradient(colors: palette.primaryGradient), shape: BoxShape.circle)),
                const SizedBox(height: 8),
                Text(paletteType.name[0].toUpperCase() + paletteType.name.substring(1), style: TextStyle(fontSize: 10, color: isSelected ? palette.textPrimary : Colors.white54, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _switch(BuildContext context, String label, bool val) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        trailing: Switch(value: val, onChanged: (_) {}, activeThumbColor: const Color(0xFF6366F1)),
      ),
    );
  }

  Widget _link(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.white54, size: 20),
        title: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        trailing: const Icon(Icons.chevron_right, color: Colors.white24),
        onTap: () {},
      ),
    );
  }
}
// Adding navigation to Settings from Dashboard or Profile
// Usually Settings is a sub-page or pushed. I will add it to the router.
// Fix for the router provider would be needed to add the /settings path.
// For now I'll implement it and add to router.
