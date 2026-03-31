// lib/shared/models/user_profile.dart
import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 0)
class UserProfile extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;
  @HiveField(2)
  final double weight; // kg
  @HiveField(3)
  final double height; // cm
  @HiveField(4)
  final int dailyStepGoal;
  @HiveField(5)
  final int weeklyWorkoutGoal;

  UserProfile({
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
    required this.dailyStepGoal,
    required this.weeklyWorkoutGoal,
  });
  
  double get bmi => weight / ((height / 100) * (height / 100));
}

// lib/shared/models/activity_day.dart
@HiveType(typeId: 1)
class ActivityDay extends HiveObject {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final int steps;
  @HiveField(2)
  final double calories;
  @HiveField(3)
  final double distance;
  @HiveField(4)
  final int activeMinutes;
  @HiveField(5)
  final int workoutsCompleted;

  ActivityDay({
    required this.date,
    this.steps = 0,
    this.calories = 0,
    this.distance = 0,
    this.activeMinutes = 0,
    this.workoutsCompleted = 0,
  });

  int get intensityLevel {
    if (steps == 0) return 0;
    if (steps < 3000) return 1;
    if (steps < 6000) return 2;
    if (steps < 9000) return 3;
    return 4;
  }
}

// lib/shared/models/exercise.dart
@HiveType(typeId: 2)
class Exercise {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String? gifUrl;
  @HiveField(5)
  final List<String> targetMuscles;

  Exercise({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    this.gifUrl,
    required this.targetMuscles,
  });
}

// lib/shared/models/workout.dart
@HiveType(typeId: 3)
class WorkoutSession extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final List<WorkoutExercise> exercises;
  @HiveField(4)
  final Duration totalDuration;

  WorkoutSession({
    required this.id,
    required this.name,
    required this.date,
    required this.exercises,
    required this.totalDuration,
  });
}

@HiveType(typeId: 4)
class WorkoutExercise {
  @HiveField(0)
  final String exerciseId;
  @HiveField(1)
  final List<ExerciseSet> sets;

  WorkoutExercise({required this.exerciseId, required this.sets});
}

@HiveType(typeId: 5)
class ExerciseSet {
  @HiveField(0)
  final int reps;
  @HiveField(1)
  final double weight;
  @HiveField(2)
  final bool isCompleted;

  ExerciseSet({required this.reps, required this.weight, this.isCompleted = false});
}
