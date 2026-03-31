// lib/features/wellness/wellness_screen.dart
import 'package:flutter/material.dart';
import '../../shared/widgets/shared_widgets.dart';

class WellnessScreen extends StatelessWidget {
  const WellnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: _WellnessHero(),
              title: Text('ZEN CENTER', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 4)),
              centerTitle: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const _MoodDialsGrid(),
                const SizedBox(height: 48),
                const _SectionTitle('GUIDED SESSIONS'),
                const SizedBox(height: 24),
                const _SessionPill(title: 'MORNING ASCENSION', time: '10M', color: Colors.blueAccent),
                const SizedBox(height: 12),
                const _SessionPill(title: 'DEEP SLEEP COCOON', time: '45M', color: Colors.purpleAccent),
                const SizedBox(height: 12),
                const _SessionPill(title: 'VAGUS NERVE RELEASE', time: '5M', color: Colors.tealAccent),
                const SizedBox(height: 120),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _WellnessHero extends StatelessWidget {
  const _WellnessHero();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.tealAccent.withValues(alpha: 0.1), Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.auto_awesome, color: Colors.tealAccent, size: 64),
                const SizedBox(height: 12),
                const Text('RECOVERY SCORE: 84%', style: TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.w900, fontSize: 16)),
                Text('Optimal Readiness for Training', style: TextStyle(color: Colors.white.withValues(alpha: 0.2), fontSize: 10, letterSpacing: 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MoodDialsGrid extends StatelessWidget {
  const _MoodDialsGrid();
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _MoodCap(icon: Icons.sentiment_very_dissatisfied, color: Colors.red),
            _MoodCap(icon: Icons.sentiment_dissatisfied, color: Colors.orange),
            _MoodCap(icon: Icons.sentiment_neutral, color: Colors.amber),
            _MoodCap(icon: Icons.sentiment_satisfied, color: Colors.lightGreen),
            _MoodCap(icon: Icons.sentiment_very_satisfied, color: Colors.green),
          ],
        ),
      ],
    );
  }
}

class _MoodCap extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _MoodCap({required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.05), shape: BoxShape.circle, border: Border.all(color: color.withValues(alpha: 0.1))),
      child: Icon(icon, color: color, size: 24),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(color: Colors.white.withValues(alpha: 0.2), fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold));
  }
}

class _SessionPill extends StatelessWidget {
  final String title, time;
  final Color color;
  const _SessionPill({required this.title, required this.time, required this.color});
  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(Icons.play_arrow_rounded, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1))),
          Text(time, style: TextStyle(color: color.withValues(alpha: 0.5), fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1)),
        ],
      ),
    );
  }
}
