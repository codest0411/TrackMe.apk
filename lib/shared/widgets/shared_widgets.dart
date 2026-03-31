import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:intl/intl.dart';

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
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding ?? const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: color ?? (isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.02)),
          gradient: gradient != null ? LinearGradient(colors: gradient!, begin: Alignment.topLeft, end: Alignment.bottomRight) : null,
          boxShadow: isDark ? [
            BoxShadow(color: Colors.black.withValues(alpha: 0.4), blurRadius: 40, offset: const Offset(0, 10)),
            if (color != null) BoxShadow(color: color!.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 8)),
          ] : [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 40, offset: const Offset(0, 10)),
          ],
          border: Border.all(color: Colors.white.withValues(alpha: 0.08), width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: child,
          ),
        ),
      ),
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
            strokeWidth: 20,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(steps.toString(), style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: size * 0.2)),
            Text('of $goal steps', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
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
        colors: [progressColor.withValues(alpha: 0.5), progressColor],
        stops: const [0, 1],
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
    
    // Add glowing dot at the end
    /* logic to find end point would go here */
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ActivityHeatmap extends StatelessWidget {
  final List<ActivityDay> days;

  const ActivityHeatmap({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    final int weeks = (days.length / 7).ceil();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 140, // 7 rows x 16px + spacing
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(weeks, (wIndex) {
                return Column(
                  children: List.generate(7, (dIndex) {
                    final int dayIdx = (wIndex * 7) + dIndex;
                    if (dayIdx >= days.length) return const SizedBox.shrink();
                    final day = days[dayIdx];
                    return _buildCell(context, day);
                  }),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildLegend(context),
      ],
    );
  }

  Widget _buildCell(BuildContext context, ActivityDay day) {
    Color cellColor;
    switch (day.intensityLevel) {
      case 0: cellColor = const Color(0xFF1a1a2a); break;
      case 1: cellColor = const Color(0xFF3F3F74); break;
      case 2: cellColor = const Color(0xFF5E5EA3); break;
      case 3: cellColor = const Color(0xFF7F7FD1); break;
      case 4: cellColor = const Color(0xFFB388FF); break;
      default: cellColor = const Color(0xFF1a1a2a);
    }

    final bool isToday = DateFormat('yyyy-MM-dd').format(day.date) == DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Container(
      width: 14,
      height: 14,
      margin: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        color: cellColor,
        borderRadius: BorderRadius.circular(3),
        border: isToday ? Border.all(color: Colors.white, width: 1) : null,
      ),
    );
  }

  Widget _buildLegend(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Less ', style: TextStyle(fontSize: 10, color: Colors.white54)),
        _legendSquare(const Color(0xFF1a1a2a)),
        _legendSquare(const Color(0xFF3F3F74)),
        _legendSquare(const Color(0xFF5E5EA3)),
        _legendSquare(const Color(0xFF7F7FD1)),
        _legendSquare(const Color(0xFFB388FF)),
        const Text(' More', style: TextStyle(fontSize: 10, color: Colors.white54)),
      ],
    );
  }

  Widget _legendSquare(Color color) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
    );
  }
}
