// lib/features/profile/profile_screen.dart
import 'package:flutter/material.dart';
import '../../shared/widgets/shared_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 32),
            _buildBMIGauge(context),
            const SizedBox(height: 24),
            _buildAchievementSection(context),
            const SizedBox(height: 24),
            _buildLifetimeStats(context),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [Color(0xFF6366F1), Color(0xFFA855F7)]),
          ),
          child: const CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=alex')),
        ),
        const SizedBox(height: 16),
        Text('Alex Johnson', style: GoogleFonts.syne(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        const Text('Elite Athlete • Member since 2024', style: TextStyle(color: Colors.white54, fontSize: 13)),
      ],
    );
  }

  Widget _buildBMIGauge(BuildContext context) {
    return PremiumCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('BMI Status', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: const Color(0xFF10B981).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(100)), child: const Text('NORMAL', style: TextStyle(color: Color(0xFF10B981), fontSize: 10, fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('22.4', style: GoogleFonts.syne(fontSize: 48, fontWeight: FontWeight.w800, color: Colors.white)),
              const SizedBox(width: 8),
              const Text('kg/m²', style: TextStyle(color: Colors.white38, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 12),
          _gaugeSlider(22.4),
        ],
      ),
    );
  }

  Widget _gaugeSlider(double val) {
    return Container(
      height: 8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white10),
      child: Stack(children: [
        FractionallySizedBox(widthFactor: 0.45, child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), gradient: const LinearGradient(colors: [Colors.blue, Colors.green, Colors.orange, Colors.red])))),
        Align(alignment: const Alignment(-0.1, 0), child: Container(width: 12, height: 12, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle))),
      ]),
    );
  }

  Widget _buildAchievementSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Achievements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _badge('🏃‍♂️', '10k Steps', true),
              _badge('🔥', '7 Day Streak', true),
              _badge('🍗', 'Bulk Master', true),
              _badge('💪', 'Powerlifter', false),
              _badge('🥇', 'First 5k Run', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _badge(String emoji, String label, bool unlocked) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: unlocked ? Colors.white12 : Colors.white.withValues(alpha: 0.02), shape: BoxShape.circle),
            child: Opacity(
              opacity: unlocked ? 1 : 0.2,
              child: Text(emoji, style: const TextStyle(fontSize: 24)),
            ),
          ),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: unlocked ? Colors.white70 : Colors.white24)),
        ],
      ),
    );
  }

  Widget _buildLifetimeStats(BuildContext context) {
    return PremiumCard(
      child: Column(
        children: [
          const Row(children: [Icon(Icons.auto_graph, color: Color(0xFF6366F1), size: 20), SizedBox(width: 12), Text('Lifetime Impact', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))]),
          const SizedBox(height: 24),
          _rowStat('Total Steps', '1,240,432'),
          _rowStat('Calories Burned', '42,500 kcal'),
          _rowStat('Workouts Completed', '156'),
          _rowStat('Active Hours', '384h'),
        ],
      ),
    );
  }

  Widget _rowStat(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 13)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
