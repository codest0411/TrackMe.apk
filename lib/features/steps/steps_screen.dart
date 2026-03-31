// lib/features/steps/steps_screen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../shared/widgets/shared_widgets.dart';

class StepsScreen extends StatelessWidget {
  const StepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detailed Steps')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildChartCard(context),
            const SizedBox(height: 24),
            _buildHistoryList(context),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard(BuildContext context) {
    return PremiumCard(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Weekly Trend', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              DropdownButton<String>(
                value: 'Weekly',
                items: ['Daily', 'Weekly', 'Monthly'].map((String value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
                onChanged: (_) {},
                dropdownColor: const Color(0xFF1E1E2E),
                underline: const SizedBox(),
                style: const TextStyle(color: Color(0xFF00E5FF)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 12000,
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (val, _) => Text(['M', 'T', 'W', 'T', 'F', 'S', 'S'][val.toInt() % 7], style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 10)))),
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _group(0, 4200), _group(1, 8500), _group(2, 6300), _group(3, 11000), _group(4, 7800), _group(5, 5000), _group(6, 9200),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _group(int x, double y) {
    return BarChartGroupData(x: x, barRods: [BarChartRodData(toY: y, color: const Color(0xFF00E5FF), width: 16, borderRadius: BorderRadius.circular(4))]);
  }

  Widget _buildHistoryList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 16),
        _historyItem('Yesterday', '9,420 steps', '🔥 Completed', const Color(0xFF10B981)),
        _historyItem('Wednesday', '11,200 steps', '🔥 Completed', const Color(0xFF10B981)),
        _historyItem('Tuesday', '6,800 steps', 'Target: 10,000', Colors.white.withValues(alpha: 0.38)),
        _historyItem('Monday', '8,100 steps', '🔥 Streak maintained', const Color(0xFFF59E0B)),
      ],
    );
  }

  Widget _historyItem(String day, String steps, String badge, Color badgeColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(day, style: const TextStyle(color: Colors.white70, fontSize: 14)),
            Text(steps, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ]),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: badgeColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(100)),
            child: Text(badge, style: TextStyle(color: badgeColor, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
