// lib/features/dashboard/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/widgets/shared_widgets.dart';
import '../../shared/services/services.dart';
import '../../shared/models/models.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    const int dailyGoal = 10000;
    const int currentSteps = 8432;
    const double calories = 1240.0;
    const int heartRate = 72;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            collapsedHeight: 100,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.black.withValues(alpha: 0.8),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground, StretchMode.blurBackground],
              background: const _HeaderHero(steps: currentSteps, goal: dailyGoal),
              title: Text('TRACKME', style: GoogleFonts.syne(fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 2, fontSize: 18)),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 16),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const _SectionHeader('BIOMETRICS LIVE'),
                const SizedBox(height: 16),
                const _StatisticGrid(calories: calories, heartRate: heartRate),
                const SizedBox(height: 32),
                const _SectionHeader('ACTIVITY CONSISTENCY'),
                const SizedBox(height: 16),
                const _HeatmapInteraction(),
                const SizedBox(height: 32),
                const _SectionHeader('TODAY\'S WORKOUTS'),
                const SizedBox(height: 16),
                const WorkoutCard(title: 'MORNING HIIT', emoji: '🔥', duration: '45m', burned: '420 kcal', intensity: '85%'),
                const SizedBox(height: 12),
                const WorkoutCard(title: 'RECOVERY YOGA', emoji: '🧘', duration: '20m', burned: '80 kcal', intensity: '30%'),
                const SizedBox(height: 120),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold));
  }
}

class _HeatmapInteraction extends StatelessWidget {
  const _HeatmapInteraction();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ActivityDay>>(
      future: StorageService.getLastHalfYear(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        return PremiumCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActivityHeatmap(days: snapshot.data!),
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('90 Day consistency: ', style: TextStyle(color: Colors.white24, fontSize: 10)),
                  Text('98%', style: TextStyle(color: Colors.greenAccent, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeaderHero extends StatelessWidget {
  final int steps, goal;
  const _HeaderHero({required this.steps, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [Colors.blueAccent.withValues(alpha: 0.15), Colors.black],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: StepRing(
            steps: steps,
            goal: goal,
            size: 260,
            baseColor: Colors.white10,
            progressColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}

class _StatisticGrid extends StatelessWidget {
  final double calories;
  final int heartRate;
  const _StatisticGrid({required this.calories, required this.heartRate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AnimatedStatCard(label: 'CALORIES', value: '${calories.toInt()}', unit: 'kcal', icon: Icons.local_fire_department, color: Colors.orange)),
        const SizedBox(width: 16),
        Expanded(child: AnimatedStatCard(label: 'HEART RATE', value: '$heartRate', unit: 'bpm', icon: Icons.favorite, color: Colors.red)),
      ],
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title, emoji, duration, burned, intensity;
  const WorkoutCard({super.key, required this.title, required this.emoji, required this.duration, required this.burned, required this.intensity});

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(16)),
            child: Text(emoji, style: const TextStyle(fontSize: 24)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _MetaLabel(icon: Icons.timer, val: duration),
                    const SizedBox(width: 12),
                    _MetaLabel(icon: Icons.bolt, val: burned),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(intensity, style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w900, fontSize: 16)),
              const Text('INTENSITY', style: TextStyle(color: Colors.white24, fontSize: 8)),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetaLabel extends StatelessWidget {
  final IconData icon;
  final String val;
  const _MetaLabel({required this.icon, required this.val});
  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(icon, size: 10, color: Colors.white38), const SizedBox(width: 4), Text(val, style: const TextStyle(color: Colors.white38, fontSize: 10))]);
  }
}
