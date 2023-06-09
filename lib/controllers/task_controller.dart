import 'dart:convert';
import 'package:get/get.dart';
import 'package:same_boat_project/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskController extends GetxController {
  List<Todo> get getTasks => todos;
  final RxList<Todo> todos = <Todo>[].obs;
  final _preferencesKey = 'todos';
  @override
  void onInit() {
    super.onInit();
    _loadTodos();
  }

  void _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosData = prefs.getStringList(_preferencesKey) ?? [];

    todos.value = todosData.map((todoData) {
      final todoMap = Map<String, dynamic>.from(json.decode(todoData));
      return Todo.fromJson(todoMap);
    }).toList();
  }

  void addTodo(String title, String note) async {
    todos.add(Todo(
      title: title,
      note: note,

    ));
    await _saveTodos();
  }

  void removeTodo(int index) async {
    todos.removeAt(index);
    await _saveTodos();
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosData = todos.map((todo) => json.encode(todo.toJson())).toList();
    prefs.setStringList(_preferencesKey, todosData);
  }
}
