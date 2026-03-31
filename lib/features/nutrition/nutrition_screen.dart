// lib/features/nutrition/nutrition_screen.dart
import 'package:flutter/material.dart';
import '../../shared/widgets/shared_widgets.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: _NutritionHero(),
              title: const Text('FUEL & MACROS', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 2)),
              centerTitle: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const _ActionGrid(),
                const SizedBox(height: 32),
                const Text('RECENTLY LOGGED', style: TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                const _FoodItem('Oatmeal with Blueberries', '320 kcal', 'Breakfast'),
                const _FoodItem('Grilled Chicken Salad', '450 kcal', 'Lunch'),
                const _FoodItem('Whey Protein Shake', '140 kcal', 'Snack'),
                const SizedBox(height: 120),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _NutritionHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.orangeAccent.withValues(alpha: 0.1), Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('1,840', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w900)),
              Text('CALORIES CONSUMED', style: TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 2)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionGrid extends StatelessWidget {
  const _ActionGrid();
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: _ActionTile(icon: Icons.camera_alt, label: 'SCAN', color: Colors.orange)),
        SizedBox(width: 16),
        Expanded(child: _ActionTile(icon: Icons.qr_code_scanner, label: 'BARCODE', color: Colors.green)),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _ActionTile({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}

class _FoodItem extends StatelessWidget {
  final String name, cal, meal;
  const _FoodItem(this.name, this.cal, this.meal);
  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(meal, style: const TextStyle(color: Colors.white24, fontSize: 10))]),
          const Spacer(),
          Text(cal, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}
