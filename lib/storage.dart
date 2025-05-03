import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TodoStorage {
  static const _key = 'todos';

  static Future<void> saveTodos(List<Map<String, dynamic>> todos) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode(todos));
  }

  static Future<List<Map<String, dynamic>>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosString = prefs.getString(_key);
    if (todosString != null) {
      return List<Map<String, dynamic>>.from(jsonDecode(todosString));
    } else {
      return [];
    }
  }
}
