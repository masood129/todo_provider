import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_provider/model.dart';

class ProviderTodo extends ChangeNotifier {
  final List<TodoModel> todos = [];
  TextEditingController title = TextEditingController();
  TextEditingController text = TextEditingController();

  void addTodo(context) {
    todos.add(TodoModel(
      text: text.text,
      title: title.text,
    ));
    title.clear();
    text.clear();
    notifyListeners();
    Navigator.pop(context);
    // var box = Hive.box('myBox');
    // box.put('todolist', 'mamad');
    // print(box.get('todolist'));
  }

  void save() {
    // box.put("todolist", jsonEncode(todos));
  }

  void changeLanguege(Locale value) {
    notifyListeners();
  }
}
