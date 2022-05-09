import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_provider/todomodel.dart';

import 'main.dart';

class ProviderTodo extends ChangeNotifier {

  ProviderTodo() {
    load();
  }

  late List<TodoModel> todos = [];
  TextEditingController title = TextEditingController();
  TextEditingController text = TextEditingController();

  void addTodo(context) {
    todos.add(TodoModel(
      title.text,
      text.text,
    ));
    title.clear();
    text.clear();
    save();
    notifyListeners();
    Navigator.pop(context);
  }

  var todoBox = Hive.box('todos');

  void save() {
    todoBox.put("todolist", todos);
    List<TodoModel> a = todoBox.get("todolist");
    print(a.length);
  }

  Future<void> load() async {
    todos.clear();
    var a = todoBox.get("todolist");
    if (a != null) {
      if(a is List<dynamic>) {
        for (var element in a) {
          todos.add(element);
        }
      }
    }
    notifyListeners();
  }

  void changeLanguege(Locale value) {
    notifyListeners();
  }
}
