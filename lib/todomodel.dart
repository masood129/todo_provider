import 'package:hive/hive.dart';
part 'todomodel.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? text;
  @HiveField(2)
  List<TodoModel>? todoModels;
  TodoModel(this.title,this.text);
}

