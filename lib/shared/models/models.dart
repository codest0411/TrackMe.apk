// lib/shared/models/models.dart
import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class UserProfile extends HiveObject {
  @HiveField(0) String name;
  @HiveField(1) double height;    // cm
  @HiveField(2) double weight;    // kg
  @HiveField(3) int age;
  @HiveField(4) int dailyStepGoal;
  @HiveField(5) String gender;
  @HiveField(6) int fitnessXP;      // Rookie (0) → Legend (12000)
  @HiveField(7) List<String> unlockedBadges;
  @HiveField(8) Map<String, dynamic> measurements; // waist, chest, etc.

  UserProfile({
    required this.name,
    required this.height,
    required this.weight,
    required this.age,
    required this.dailyStepGoal,
    required this.gender,
    this.fitnessXP = 0,
    this.unlockedBadges = const [],
    this.measurements = const {},
  });

  String get fitnessLevel {
    if (fitnessXP >= 12000) return 'Legend';
    if (fitnessXP >= 7000) return 'Elite';
    if (fitnessXP >= 3500) return 'Champion';
    if (fitnessXP >= 1500) return 'Athlete';
    if (fitnessXP >= 500) return 'Contender';
    return 'Rookie';
  }
}

@HiveType(typeId: 1)
class ActivityDay extends HiveObject {
  @HiveField(0) final DateTime date;
  @HiveField(1) int steps;
  @HiveField(2) int waterIntake; // ml
  @HiveField(3) List<String> workoutsDone;
  @HiveField(4) int sleepMinutes;
  @HiveField(5) int moodScore; // 1-5
  @HiveField(6) double hrvValue; // for stress score

  ActivityDay({
    required this.date,
    this.steps = 0,
    this.waterIntake = 0,
    this.workoutsDone = const [],
    this.sleepMinutes = 0,
    this.moodScore = 3,
    this.hrvValue = 0.0,
  });

  // 0: empty / 1: 1-3k / 2: 3-6k / 3: 6-9k / 4: 10k+
  int get intensityLevel {
    if (steps >= 10000) return 4;
    if (steps >= 6000) return 3;
    if (steps >= 3000) return 2;
    if (steps >= 1000) return 1;
    return 0;
  }
}

@HiveType(typeId: 2)
class WorkoutSession extends HiveObject {
  @HiveField(0) final String title;
  @HiveField(1) final List<ExerciseLog> exercises;
  @HiveField(2) final DateTime startTime;
  @HiveField(3) final int durationSeconds;

  WorkoutSession({
    required this.title,
    required this.exercises,
    required this.startTime,
    required this.durationSeconds,
  });
}

@HiveType(typeId: 3)
class ExerciseLog extends HiveObject {
  @HiveField(0) final String name;
  @HiveField(1) final int sets;
  @HiveField(2) final int reps;
  @HiveField(3) final double weight;

  ExerciseLog({required this.name, required this.sets, required this.reps, this.weight = 0});
}

@HiveType(typeId: 4)
class JournalEntry extends HiveObject {
  @HiveField(0) final DateTime date;
  @HiveField(1) final String text;
  @HiveField(2) final List<String> tags;

  JournalEntry({required this.date, required this.text, this.tags = const []});
}

// Badge constants structure (not a Hive model, static metadata)
class BadgeMetadata {
  final String id;
  final String title;
  final String description;
  final String lottiePath;
  final String icon;

  const BadgeMetadata({
    required this.id,
    required this.title,
    required this.description,
    required this.lottiePath,
    required this.icon,
  });
}
