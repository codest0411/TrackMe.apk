// lib/features/onboarding/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Track Every Step',
      subtitle: 'Real-time step tracking with high precision sensors and background monitoring.',
      icon: Icons.directions_walk_rounded,
      color: const Color(0xFF6366F1),
    ),
    OnboardingData(
      title: 'Master Your Workouts',
      subtitle: 'Library of 50+ exercises with professional timers and detailed performance tracking.',
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFFA855F7),
    ),
    OnboardingData(
      title: 'Reach Your Goals',
      subtitle: 'Set daily targets and stay motivated with smart notifications and streaks.',
      icon: Icons.auto_awesome_rounded,
      color: const Color(0xFF10B981),
    ),
    OnboardingData(
      title: 'Premium Experience',
      subtitle: 'Beautiful themes, glassmorphism, and smooth animations in every screen.',
      icon: Icons.workspace_premium_rounded,
      color: const Color(0xFFF59E0B),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) => setState(() => _currentPage = value),
            itemCount: _pages.length,
            itemBuilder: (context, index) => _buildPage(_pages[index]),
          ),
          _buildNavigationOverlay(),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingData data) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [data.color.withValues(alpha: 0.2), Colors.black],
          stops: const [0, 0.4],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(color: data.color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(data.icon, size: 100, color: data.color).animate().scale(duration: 800.ms, curve: Curves.elasticOut),
          ),
          const SizedBox(height: 60),
          Text(data.title, textAlign: TextAlign.center, style: GoogleFonts.syne(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 20),
          Text(data.subtitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.7), height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildNavigationOverlay() {
    return Positioned(
      bottom: 60,
      left: 40,
      right: 40,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) => _buildDot(index)),
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {
              if (_currentPage == _pages.length - 1) {
                context.go('/');
              } else {
                _pageController.nextPage(duration: 600.ms, curve: Curves.easeInOutQuint);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _pages[_currentPage].color,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: Text(_currentPage == _pages.length - 1 ? "GET STARTED" : "CONTINUE"),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    bool selected = _currentPage == index;
    return AnimatedContainer(
      duration: 300.ms,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: selected ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(color: selected ? _pages[_currentPage].color : Colors.white24, borderRadius: BorderRadius.circular(4)),
    );
  }
}

class OnboardingData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  OnboardingData({required this.title, required this.subtitle, required this.icon, required this.color});
}
