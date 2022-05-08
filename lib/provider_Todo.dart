import 'package:flutter/material.dart';
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
  }
}
