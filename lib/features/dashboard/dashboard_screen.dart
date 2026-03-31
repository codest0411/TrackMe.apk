// lib/features/dashboard/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/widgets/shared_widgets.dart';
import '../../shared/services/services.dart';
import '../../shared/models/models.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepStatus = ref.watch(stepCountProvider);
    final currentSteps = stepStatus.maybeWhen(data: (steps) => steps.steps, orElse: () => 0);
    
    // Static mockup data for heatmap
    final mockDays = List.generate(182, (index) => ActivityDay(
      date: DateTime.now().subtract(Duration(days: 181 - index)),
      steps: (index % 10 == 0) ? 12000 : (index % 5 == 0) ? 8000 : 4000,
    ));

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 32),
            _buildLiveStepCard(context, currentSteps),
            const SizedBox(height: 24),
            _buildHeatmapCard(context, mockDays),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _buildStatCard(context, '1,240', 'kcal', Icons.local_fire_department_rounded, const Color(0xFFF94C10))),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard(context, '8.2', 'km', Icons.location_on_rounded, const Color(0xFF00E5FF))),
              ],
            ),
            const SizedBox(height: 24),
            _buildUpcomingWorkout(context),
            const SizedBox(height: 100), // Bottom nav space
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Good Morning, Alex 💪', style: GoogleFonts.syne(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 4),
        Text('Ready for today\'s goal?', style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 16)),
      ],
    );
  }

  Widget _buildLiveStepCard(BuildContext context, int steps) {
    return PremiumCard(
      height: 280,
      gradient: [const Color(0xFF4C8CFF).withValues(alpha: 0.1), const Color(0xFF00E5FF).withValues(alpha: 0.05)],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StepRing(steps: steps, goal: 10000, size: 180, baseColor: Colors.white24, progressColor: const Color(0xFF00E5FF)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSimpleStat('83%', 'Goal progress'),
              const SizedBox(height: 24),
              _buildSimpleStat('12', 'Active minutes'),
              const SizedBox(height: 24),
              _buildSimpleStat('🔥 4', 'Day streak'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.white54)),
      ],
    );
  }

  Widget _buildHeatmapCard(BuildContext context, List<ActivityDay> days) {
    return PremiumCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Consistency Map', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 16),
          ActivityHeatmap(days: days),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStreakInfo('🔥 12', 'Current'),
              _buildStreakInfo('📅 142', 'Total Days'),
              _buildStreakInfo('🎯 94%', 'Completion'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStreakInfo(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.white54)),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String value, String unit, IconData icon, Color color) {
    return PremiumCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(unit, style: const TextStyle(fontSize: 14, color: Colors.white54)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingWorkout(BuildContext context) {
    return PremiumCard(
      gradient: [const Color(0xFFBB86FC).withValues(alpha: 0.15), const Color(0xFF9965F4).withValues(alpha: 0.05)],
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFBB86FC).withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16)),
            child: const Icon(Icons.fitness_center_rounded, color: Color(0xFFBB86FC)),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Upper Body HIIT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Scheduled for 5:30 PM', style: TextStyle(color: Colors.white54, fontSize: 14)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white24),
        ],
      ),
    );
  }
}
