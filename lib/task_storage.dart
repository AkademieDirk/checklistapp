import 'package:shared_preferences/shared_preferences.dart';

class TaskStorage {
  // Speichert die Aufgaben in SharedPreferences
  static Future<void> saveTasks(List<String> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', tasks);
  }

  // Lädt die Aufgaben aus SharedPreferences
  static Future<List<String>> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('tasks') ?? [];
  }

  // Fügt eine Aufgabe hinzu und speichert die aktualisierte Liste
  static Future<void> addTask(List<String> tasks, String task) async {
    tasks.add(task);
    await saveTasks(tasks);
  }
}
