// lib/shared/widgets/shared_widgets.dart
import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../models/models.dart';

class PremiumCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final List<Color>? gradient;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  const PremiumCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.gradient,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: gradient != null ? LinearGradient(colors: gradient!, begin: Alignment.topLeft, end: Alignment.bottomRight) : null,
          color: gradient == null ? (color ?? Colors.white.withValues(alpha: 0.05)) : null,
          border: Border.all(color: Colors.white.withValues(alpha: 0.08), width: 1.5),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 20, offset: const Offset(0, 10)),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(20),
            child: child,
          ),
        ),
      ),
    );
  }
}

class AnimatedStatCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  const AnimatedStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(height: 16),
          Text(label, style: const TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
              const SizedBox(width: 4),
              Text(unit, style: const TextStyle(color: Colors.white38, fontSize: 12)),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms, delay: 100.ms).slideY(begin: 0.1, end: 0, curve: Curves.easeOut);
  }
}

class ActivityHeatmap extends StatelessWidget {
  final List<ActivityDay> days;

  const ActivityHeatmap({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 15,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1,
      ),
      itemCount: min(days.length, 90), 
      itemBuilder: (context, index) {
        final day = days[index];
        final double opacity = (day.steps / 10000).clamp(0.1, 1.0);
        return Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent.withValues(alpha: opacity),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              if (opacity > 0.8) BoxShadow(color: Colors.blueAccent.withValues(alpha: 0.3), blurRadius: 4, spreadRadius: 1),
            ],
          ),
        );
      },
    );
  }
}

class StepRing extends StatelessWidget {
  final int steps;
  final int goal;
  final double size;
  final Color baseColor;
  final Color progressColor;

  const StepRing({
    super.key,
    required this.steps,
    required this.goal,
    this.size = 200,
    required this.baseColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = (steps / goal).clamp(0.0, 1.0);
    
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: _StepPainter(
            percentage: percentage,
            baseColor: baseColor,
            progressColor: progressColor,
            strokeWidth: size * 0.12,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(steps.toString(), style: GoogleFonts.syne(fontSize: size * 0.22, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1)),
            Text('${(percentage * 100).toInt()}% GOAL', style: TextStyle(color: progressColor.withValues(alpha: 0.6), fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold)),
          ],
        ).animate().scale(delay: 400.ms, duration: 600.ms, curve: Curves.elasticOut),
      ],
    );
  }
}

class _StepPainter extends CustomPainter {
  final double percentage;
  final Color baseColor;
  final Color progressColor;
  final double strokeWidth;

  _StepPainter({
    required this.percentage,
    required this.baseColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - strokeWidth / 2;

    // Outer Glow Shadow
    final glowPaint = Paint()
      ..color = progressColor.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth * 2
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);
    canvas.drawCircle(center, radius, glowPaint);

    // Background track
    final bgPaint = Paint()
      ..color = baseColor.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..shader = SweepGradient(
        colors: [progressColor.withValues(alpha: 0.5), progressColor, progressColor.withValues(alpha: 0.8)],
        stops: const [0, 0.8, 1],
        transform: const GradientRotation(-pi / 2),
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * percentage,
      false,
      progressPaint,
    );

    // End Glow Cap
    final double endAngle = -pi / 2 + 2 * pi * percentage;
    final endOffset = Offset(center.dx + radius * cos(endAngle), center.dy + radius * sin(endAngle));
    final capPaint = Paint()
      ..color = Colors.white
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawCircle(endOffset, strokeWidth * 0.3, capPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class BadgeUnlockView extends StatelessWidget {
  final String title;
  final String lottiePath;

  const BadgeUnlockView({super.key, required this.title, required this.lottiePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(lottiePath, height: 200),
          const SizedBox(height: 20),
          Text('UNLOCKED: $title', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}
