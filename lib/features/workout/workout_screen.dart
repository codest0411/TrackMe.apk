import 'package:flutter/material.dart';
import '../../shared/widgets/shared_widgets.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Hub')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatBanner(context),
            const SizedBox(height: 32),
            _buildSectionHeader('YOUR PLANS'),
            _buildPlanCard('Upper Body HIIT', '45 min • 320 kcal', const Color(0xFFBB86FC)),
            _buildPlanCard('Leg Day Destroy', '60 min • 450 kcal', const Color(0xFFF94C10)),
            _buildPlanCard('Active Mobility', '20 min • 80 kcal', const Color(0xFF10B981)),
            const SizedBox(height: 32),
            _buildSectionHeader('EXERCISE LIBRARY'),
            _buildExerciseGrid(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBanner(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _miniStat('12', 'Weekly Workouts')),
        Expanded(child: _miniStat('4.2', 'Avg. Duration')),
        Expanded(child: _miniStat('🏆 3', 'Badges')),
      ],
    );
  }

  Widget _miniStat(String val, String label) {
    return Column(children: [
      Text(val, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFBB86FC))),
      Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Colors.white54)),
    ]);
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 1.5, color: Colors.white.withValues(alpha: 0.3))),
    );
  }

  Widget _buildPlanCard(String name, String detail, Color color) {
    return PremiumCard(
      margin: const EdgeInsets.only(bottom: 16),
      gradient: [color.withValues(alpha: 0.2), Colors.black45],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            Text(detail, style: const TextStyle(fontSize: 12, color: Colors.white70)),
          ]),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: color, minimumSize: const Size(80, 40), padding: const EdgeInsets.symmetric(horizontal: 16)),
            child: const Text('START', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseGrid() {
    final List<String> exercises = ['Push Ups', 'Squats', 'Deadlift', 'Pull Ups', 'Plank', 'Burpees'];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.4),
      itemCount: exercises.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.fitness_center, color: Colors.white38),
            const SizedBox(height: 12),
            Text(exercises[index], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
// lib/features/workout/workout_screen.dart components...
