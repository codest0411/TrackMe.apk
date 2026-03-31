// lib/shared/widgets/nav_bar.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:go_router/go_router.dart';

class FloatingPillNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const FloatingPillNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<FloatingPillNavBar> createState() => _FloatingPillNavBarState();
}

class _FloatingPillNavBarState extends State<FloatingPillNavBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1).chain(CurveTween(curve: Curves.easeOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0).chain(CurveTween(curve: Curves.easeIn)), weight: 50),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    if (index == 2) {
      // Center button handled by a separate modal call logic
      _triggerAction();
    } else {
      HapticFeedback.lightImpact();
      _controller.forward(from: 0);
      widget.onItemSelected(index);
    }
  }

  void _triggerAction() {
    HapticFeedback.mediumImpact();
    // Logic for center modal can be here or handled by the parent
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      height: 72,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildPillBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, PhosphorIcons.houseSimple(), 'Home'),
              _buildNavItem(1, PhosphorIcons.footprints(), 'Steps'),
              _buildCenterButton(),
              _buildNavItem(3, PhosphorIcons.barbell(), 'Workouts'),
              _buildNavItem(4, PhosphorIcons.userCircle(), 'Profile'),
            ],
          ),
          _buildActiveIndicator(),
        ],
      ),
    );
  }

  Widget _buildPillBackground() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08), width: 0.5),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.4), blurRadius: 32, offset: const Offset(0, 8))],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isActive = widget.selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTap(index),
      behavior: HitTestBehavior.opaque,
      child: ScaleTransition(
        scale: isActive ? _scaleAnimation : const AlwaysStoppedAnimation(1.0),
        child: AnimatedOpacity(
          opacity: isActive ? 1.0 : 0.5,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenterButton() {
    return Transform.translate(
      offset: const Offset(0, -12),
      child: GestureDetector(
        onTap: () {
          _triggerAction();
          // Implement Center Button logic
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => _buildCenterModal(),
          );
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF6366F1), Color(0xFFA855F7)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [BoxShadow(color: const Color(0xFF6366F1).withValues(alpha: 0.4), blurRadius: 20, offset: const Offset(0, 4))],
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  Widget _buildActiveIndicator() {
    // This requires calculating the position of the item. Simplified static mapping here.
    double calculateX(int index) {
      if (index == 0) return -0.8;
      if (index == 1) return -0.4;
      if (index == 3) return 0.4;
      if (index == 4) return 0.8;
      return 0; // Center or other
    }

    if (widget.selectedIndex == 2) return const SizedBox.shrink();

    return AnimatedAlign(
      alignment: Alignment(calculateX(widget.selectedIndex), 0.9),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      child: Container(
        width: 32,
        height: 3,
        decoration: BoxDecoration(
          color: const Color(0xFF6366F1),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildCenterModal() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E2E),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 24),
          _buildModalItem(PhosphorIcons.barbell(), 'Start Workout', const Color(0xFF4C8CFF)),
          _buildModalItem(PhosphorIcons.notebook(), 'Log Exercise', const Color(0xFFBB86FC)),
          _buildModalItem(PhosphorIcons.timer(), 'Set Timer', const Color(0xFFF94C10)),
          _buildModalItem(PhosphorIcons.drop(), 'Log Water', const Color(0xFF00E5FF)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildModalItem(IconData icon, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}

// lib/shared/widgets/app_scaffold.dart
// AppScaffold implementation...

class AppScaffold extends StatefulWidget {
  final Widget child;
  const AppScaffold({super.key, required this.child});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location == '/') return 0;
    if (location == '/steps') return 1;
    if (location == '/workout') return 3;
    if (location == '/profile') return 4;
    if (location == '/timer') return -1; // Special case for timer if it's pushed
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/steps');
        break;
      case 3:
        context.go('/workout');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        top: false,
        child: widget.child,
      ),
      bottomNavigationBar: FloatingPillNavBar(
        selectedIndex: _calculateSelectedIndex(context),
        onItemSelected: (index) => _onItemTapped(index, context),
      ),
    );
  }
}
