import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pedometer/pedometer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';

class StorageService {
  static const String profileBoxName = 'profile_box';
  static const String activityBoxName = 'activity_box';
  static const String settingsBoxName = 'settings_box';
  static const String workoutBoxName = 'workout_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    
    // In a real app we'd register adapters and open boxes here.
    // For this prototype, we'll open essential boxes.
    await Hive.openBox(profileBoxName);
    await Hive.openBox(activityBoxName);
    await Hive.openBox(settingsBoxName);
    await Hive.openBox(workoutBoxName);
  }

  static String getDateKey(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static Future<ActivityDay> getActivityDay(DateTime date) async {
    final box = Hive.box(activityBoxName);
    final key = getDateKey(date);
    final data = box.get(key);
    if (data == null) {
      final newDay = ActivityDay(date: date);
      await box.put(key, newDay);
      return newDay;
    }
    // Type casting logic would go here if Hive generated adapters were present
    return ActivityDay(date: date); // Simplified for prototype
  }

  static Future<void> updateActivityDay(ActivityDay day) async {
    final box = Hive.box(activityBoxName);
    await box.put(getDateKey(day.date), day);
  }

  static Future<List<ActivityDay>> getLastSixMonths() async {
    final List<ActivityDay> days = [];
    final now = DateTime.now();
    for (int i = 181; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      days.add(await getActivityDay(date));
    }
    return days;
  }
}

class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);
    await _notifications.initialize(initSettings);
  }

  Future<void> showStepGoalNotification(int steps, int goal) async {
    const androidDetails = AndroidNotificationDetails(
      'step_channel', 'Steps',
      channelDescription: 'Goal achievements and step tracking notifications',
      importance: Importance.high,
      priority: Priority.high,
    );
    const details = NotificationDetails(android: androidDetails);
    
    if (steps >= goal) {
      await _notifications.show(0, 'Goal Reached! 🚀', "Amazing work, you've hit your daily goal of $goal steps!", details);
    } else if (steps >= goal * 0.8) {
      await _notifications.show(1, 'Almost there!', "You're just ${goal - steps} steps away from your daily goal. Keep moving!", details);
    }
  }
}

final stepCountProvider = StreamProvider<StepCount>((ref) {
  return Pedometer.stepCountStream;
});

final pedalStatusProvider = StreamProvider<PedestrianStatus>((ref) {
  return Pedometer.pedestrianStatusStream;
});
