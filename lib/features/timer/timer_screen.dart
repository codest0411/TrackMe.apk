// lib/features/timer/timer_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../../shared/widgets/shared_widgets.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _stopwatchDisplay = "00:00.00";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _startStopwatch() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (mounted) {
        setState(() {
          final d = _stopwatch.elapsed;
          _stopwatchDisplay = "${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:${d.inSeconds.remainder(60).toString().padLeft(2, '0')}.${(d.inMilliseconds.remainder(1000) ~/ 10).toString().padLeft(2, '0')}";
        });
      }
    });
  }

  void _stopStopwatch() {
    _stopwatch.stop();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrackSuite'),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 4,
          indicatorColor: const Color(0xFF6366F1),
          dividerColor: Colors.transparent,
          tabs: const [Tab(text: 'STOPWATCH'), Tab(text: 'INTERVAL'), Tab(text: 'COUNTDOWN')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStopwatchTab(),
          _buildIntervalTab(),
          _buildCountdownTab(),
        ],
      ),
    );
  }

  Widget _buildStopwatchTab() {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const SizedBox(height: 48),
          StepRing(steps: _stopwatch.elapsed.inSeconds, goal: 60, size: 260, baseColor: Colors.white.withValues(alpha: 0.1), progressColor: const Color(0xFF6366F1)),
          const SizedBox(height: 48),
          Text(_stopwatchDisplay, style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, fontFamily: 'monospace', color: Colors.white)),
          const Spacer(),
          _buildTimerControls(_stopwatch.isRunning ? _stopStopwatch : _startStopwatch, () { setState(() { _stopwatch.reset(); _stopwatchDisplay = "00:00.00"; }); }),
        ],
      ),
    );
  }

  Widget _buildTimerControls(VoidCallback onMain, VoidCallback onReset) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: onReset, icon: Icon(Icons.refresh, color: Colors.white.withValues(alpha: 0.5), size: 32)),
        GestureDetector(
          onTap: onMain,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(color: Color(0xFF6366F1), shape: BoxShape.circle),
            child: Icon(_stopwatch.isRunning ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 48),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.flag_rounded, color: Colors.white.withValues(alpha: 0.5), size: 32)),
      ],
    );
  }

  Widget _buildIntervalTab() {
    return Center(child: Text('Interval Timer - Coming Soon', style: TextStyle(color: Colors.white.withValues(alpha: 0.5))));
  }

  Widget _buildCountdownTab() {
    return Center(child: Text('Countdown Timer - Coming Soon', style: TextStyle(color: Colors.white.withValues(alpha: 0.5))));
  }

  @override
  void dispose() {
    _tabController.dispose();
    if (_stopwatch.isRunning) {
      _timer.cancel();
    }
    super.dispose();
  }
}
