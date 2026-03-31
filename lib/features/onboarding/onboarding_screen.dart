// lib/features/onboarding/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(title: 'TRACK EVERYTHING', sub: 'From deep sleep to high intensity intervals.', icon: Icons.bolt, color: const Color(0xFF6366F1)),
    OnboardingData(title: 'AI COACHING', sub: 'Personalized recovery and training insights.', icon: Icons.auto_awesome, color: const Color(0xFFA855F7)),
    OnboardingData(title: 'SOCIAL CHALLENGES', sub: 'Compete, collaborate, and conquer together.', icon: Icons.groups_3, color: const Color(0xFF10B981)),
    OnboardingData(title: 'BIO-FEEDBACK', sub: 'Understand your body with real-time data.', icon: Icons.favorite, color: const Color(0xFFF43F5E)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemCount: _pages.length,
            itemBuilder: (context, index) => _buildPage(_pages[index]),
          ),
          Positioned(bottom: 50, left: 24, right: 24, child: _buildBottomNav()),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingData data) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [data.color.withValues(alpha: 0.2), Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(data.icon, size: 120, color: data.color).animate().scale(duration: 600.ms, curve: Curves.elasticOut).shake(hz: 2),
          const SizedBox(height: 60),
          Text(data.title, style: GoogleFonts.syne(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white), textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 48), child: Text(data.sub, style: const TextStyle(fontSize: 16, color: Colors.white70), textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: List.generate(_pages.length, (i) => _dot(i))),
        FloatingActionButton(
          backgroundColor: _pages[_currentPage].color,
          onPressed: () {
            if (_currentPage < _pages.length - 1) {
              _pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
            } else {
              context.go('/');
            }
          },
          child: Icon(_currentPage == _pages.length - 1 ? Icons.check : Icons.arrow_forward),
        ),
      ],
    );
  }

  Widget _dot(int index) {
    bool active = index == _currentPage;
    return AnimatedContainer(duration: const Duration(milliseconds: 300), margin: const EdgeInsets.only(right: 8), width: active ? 24 : 8, height: 8, decoration: BoxDecoration(color: active ? _pages[index].color : Colors.white24, borderRadius: BorderRadius.circular(4)));
  }
}

class OnboardingData {
  final String title, sub;
  final IconData icon;
  final Color color;
  OnboardingData({required this.title, required this.sub, required this.icon, required this.color});
}
