// lib/shared/widgets/nav_bar.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          child,
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FloatingPillNavBar(),
          ),
        ],
      ),
    );
  }
}

class FloatingPillNavBar extends StatelessWidget {
  const FloatingPillNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 34),
      height: 72,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12), width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavBtn(icon: Icons.dashboard_rounded, label: 'Feed', active: location == '/', path: '/'),
                _NavBtn(icon: Icons.fitness_center_rounded, label: 'Work', active: location == '/workout', path: '/workout'),
                _AddButton(),
                _NavBtn(icon: Icons.auto_awesome_rounded, label: 'Co', active: location == '/wellness', path: '/wellness'),
                _NavBtn(icon: Icons.person_rounded, label: 'You', active: location == '/profile', path: '/profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBtn extends StatelessWidget {
  final IconData icon;
  final String label, path;
  final bool active;
  const _NavBtn({required this.icon, required this.label, required this.active, required this.path});

  @override
  Widget build(BuildContext context) {
    final color = active ? Colors.blueAccent : Colors.white24;
    return GestureDetector(
      onTap: () => context.go(path),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: color, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.blueAccent, Colors.purpleAccent], begin: Alignment.topLeft, end: Alignment.bottomRight),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.blueAccent.withValues(alpha: 0.4), blurRadius: 20, spreadRadius: 2),
        ],
      ),
      child: const Icon(Icons.add, color: Colors.white, size: 28),
    );
  }
}
