// lib/features/profile/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/widgets/shared_widgets.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: const _ProfileHero(),
              title: Text('ATHLETE RESUME', style: GoogleFonts.syne(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 3)),
              centerTitle: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const _LifetimeMetricsGrid(),
                const SizedBox(height: 48),
                const _HighlightSection(),
                const SizedBox(height: 120),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHero extends StatelessWidget {
  const _ProfileHero();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blueAccent.withValues(alpha: 0.15), Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Colors.blueAccent, Colors.purpleAccent])),
              child: const CircleAvatar(radius: 60, backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=trackme_pro')),
            ),
            const SizedBox(height: 20),
            Text('CHIRAG MALHOTRA', style: GoogleFonts.syne(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.white)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(color: Colors.blueAccent.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.blueAccent.withValues(alpha: 0.2))),
              child: const Text('PRO ELITE • LVL 42', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w900, fontSize: 10, letterSpacing: 2)),
            ),
          ],
        ),
      ),
    );
  }
}

class _LifetimeMetricsGrid extends StatelessWidget {
  const _LifetimeMetricsGrid();
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: _HighlightCard(title: 'IRON LUNG', subtitle: '1,240 KM DISTANCE', icon: Icons.bolt, color: Colors.blueAccent)),
            SizedBox(width: 16),
            Expanded(child: _HighlightCard(title: 'COMMANDO', subtitle: '156 SESSIONS', icon: Icons.fitness_center, color: Colors.orangeAccent)),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _HighlightCard(title: 'SLEEP MASTER', subtitle: '98% EFFICIENCY', icon: Icons.bedtime, color: Colors.purpleAccent)),
            SizedBox(width: 16),
            Expanded(child: _HighlightCard(title: 'ZEN MASTER', subtitle: '42 MEDITATIONS', icon: Icons.auto_awesome, color: Colors.tealAccent)),
          ],
        ),
      ],
    );
  }
}

class _HighlightSection extends StatelessWidget {
  const _HighlightSection();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RECENT ACHIEVEMENTS', style: TextStyle(color: Colors.white.withValues(alpha: 0.2), fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        const _AchievementRow(title: 'Centurion (100k Steps Week)', date: 'Mar 12, 2026', color: Colors.amber),
        const _AchievementRow(title: 'Early Riser (7 Days)', date: 'Mar 08, 2026', color: Colors.blueAccent),
        const _AchievementRow(title: 'Hydration Hero (3L/Day)', date: 'Mar 01, 2026', color: Colors.greenAccent),
      ],
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color color;
  const _HighlightCard({required this.title, required this.subtitle, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14)),
          Text(subtitle, style: const TextStyle(color: Colors.white24, fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _AchievementRow extends StatelessWidget {
  final String title, date;
  final Color color;
  const _AchievementRow({required this.title, required this.date, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(height: 8, width: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 10, spreadRadius: 2)])),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text(date, style: const TextStyle(color: Colors.white24, fontSize: 10)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white12),
        ],
      ),
    );
  }
}
