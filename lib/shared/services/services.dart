// lib/shared/services/services.dart
import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pedometer/pedometer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class StorageService {
  static const String profileBoxName = 'profile_box';
  static const String activityBoxName = 'activity_box';
  static const String settingsBoxName = 'settings_box';
  static const String workoutBoxName = 'workout_box';
  static const String journalBoxName = 'journal_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<UserProfile>(profileBoxName);
    await Hive.openBox<ActivityDay>(activityBoxName);
    await Hive.openBox(settingsBoxName);
    await Hive.openBox<WorkoutSession>(workoutBoxName);
    await Hive.openBox<JournalEntry>(journalBoxName);
  }

  static String getDateKey(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  static Future<ActivityDay> getActivityDay(DateTime date) async {
    final box = Hive.box<ActivityDay>(activityBoxName);
    final key = getDateKey(date);
    final data = box.get(key);
    if (data == null) {
      final newDay = ActivityDay(date: date);
      await box.put(key, newDay);
      return newDay;
    }
    return data;
  }

  static Future<void> updateActivityDay(ActivityDay day) async {
    final box = Hive.box<ActivityDay>(activityBoxName);
    await box.put(getDateKey(day.date), day);
  }

  static Future<List<ActivityDay>> getLastHalfYear() async {
    final List<ActivityDay> days = [];
    final now = DateTime.now();
    for (int i = 181; i >= 0; i--) {
      days.add(await getActivityDay(now.subtract(Duration(days: i))));
    }
    return days;
  }
}

class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  static const Map<String, List<String>> _categories = {
    'morning': [
      "Rise and shine! The world is yours for the taking. 💪",
      "Empty your mind, feel your breath, and conquer the day.",
      "A journey of a thousand miles begins with a single step today."
    ],
    'steps': [
      "Quarter way! You're making progress. Let's keep moving. 🚶‍♂️",
      "Halfway there! Feel the rhythm, you're doing amazing.",
      "Just 10% left! Can you feel the finish line?"
    ],
    'goal_hit': [
      "GOAL REACHED! 🏆 You are officially unstoppable.",
      "Rings closed! Your future self is thanking you right now.",
      "Legendary work! You've crushed today's goal."
    ],
    'streak': [
      "Day 7! A whole week of consistency. You're building a new you.",
      "Day 30! Consistency breeds excellence. Keep going!",
      "100 Days! You've reached the century club. Legend Status."
    ],
    'inactivity': [
      "Been still for a while. Let's get up and stretch those legs! 🧘‍♂️",
      "Motion is lotion. A quick 5-min walk would do wonders.",
      "Your momentum is waiting. Let's break the silence."
    ],
    'wisdom': [
      "Nature never hurries, yet everything is accomplished.",
      "Your only competition is the person you were yesterday.",
      "Discipline is doing what needs to be done, even when you don't feel like it."
    ],
  };

  Future<void> init() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);
    await _notifications.initialize(initSettings);
  }

  Future<void> showCategorizedNotification(String category) async {
    final prefs = await SharedPreferences.getInstance();
    final messages = _categories[category] ?? ["Keep moving!"];
    final lastIndex = prefs.getInt('notif_idx_$category') ?? -1;
    final nextIndex = (lastIndex + 1) % messages.length;
    await prefs.setInt('notif_idx_$category', nextIndex);

    const androidDetails = AndroidNotificationDetails(
      'trackme_channel', 'TrackMe Alerts',
      importance: Importance.high, 
      priority: Priority.high,
    );
    await _notifications.show(category.hashCode, 'TrackMe', messages[nextIndex], const NotificationDetails(android: androidDetails));
  }
}

class AIService {
  static Future<String> generateWorkoutPlan(String goal) async {
    // Mocking response delay for cloud AI processing
    await Future.delayed(const Duration(seconds: 2));
    return "🗓️ YOUR 7-DAY AI PLAN ($goal)\n\nDay 1: Upper Body Strength + 10m HIIT\nDay 2: Recovery Yoga + 5k Walk\nDay 3: Lower Body + Core\nDay 4: Rest & Active Recovery\nDay 5: Full Body Cardio Blast\nDay 6: Long Run (45m zone 2)\nDay 7: Mobility & Mindset session";
  }

  static Future<Map<String, double>> estimateCalories(String imagePath) async {
    // Mock vision processing
    await Future.delayed(const Duration(milliseconds: 1500));
    return {"Calories": 450.0, "Protein": 25.0, "Carbs": 40.0, "Fat": 15.0};
  }
}

final stepCountProvider = StreamProvider<StepCount>((ref) {
  return Pedometer.stepCountStream;
});

final notificationProvider = Provider((ref) => NotificationService());
final aiServiceProvider = Provider((ref) => AIService());
