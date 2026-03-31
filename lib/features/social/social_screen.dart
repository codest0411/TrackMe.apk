// lib/features/social/social_screen.dart
import 'package:flutter/material.dart';
import '../../shared/widgets/shared_widgets.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: _SocialHero(),
              title: const Text('COMMUNITY', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 2)),
              centerTitle: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _sectionHeader('ACTIVE CHALLENGES'),
                const SizedBox(height: 16),
                const ChallengeCard(title: 'HELL WEEK (100k STEPS)', progress: 0.65, color: Colors.blueAccent),
                const SizedBox(height: 12),
                const ChallengeCard(title: 'DAWN PATROL (5 AM)', progress: 0.20, color: Colors.orangeAccent),
                const SizedBox(height: 32),
                _sectionHeader('ELITE LEADERBOARD'),
                const SizedBox(height: 16),
                const _LeaderboardTile(rank: 1, name: 'Flash Gordon', score: '24.2k XP', color: Colors.amber),
                const _LeaderboardTile(rank: 2, name: 'You (Chirag)', score: '18.1k XP', color: Colors.blueAccent),
                const _LeaderboardTile(rank: 3, name: 'Sarah Spark', score: '17.5k XP', color: Colors.orangeAccent),
                const SizedBox(height: 120),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(title, style: const TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold));
  }
}

class _SocialHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blueAccent.withValues(alpha: 0.1), Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.emoji_events, color: Colors.amber, size: 48),
              SizedBox(height: 12),
              Text('TOP 5% GLOBALLY', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeaderboardTile extends StatelessWidget {
  final int rank;
  final String name, score;
  final Color color;
  const _LeaderboardTile({required this.rank, required this.name, required this.score, required this.color});
  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text('#$rank', style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 18)),
          const SizedBox(width: 16),
          Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(score, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final String title;
  final double progress;
  final Color color;
  const ChallengeCard({super.key, required this.title, required this.progress, required this.color});
  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              const Icon(Icons.flash_on, color: Colors.blueAccent, size: 16),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(value: progress, minHeight: 6, backgroundColor: Colors.white12, valueColor: AlwaysStoppedAnimation(color)),
          ),
        ],
      ),
    );
  }
}
