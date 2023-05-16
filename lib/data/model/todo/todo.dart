import 'todo_list.dart';

class ToDoList {
  ToDoList({
      this.toDoList,});

  ToDoList.fromJson(dynamic json) {
    if (json['toDoList'] != null) {
      toDoList = [];
      json['toDoList'].forEach((v) {
        toDoList?.add(Todo.fromJson(v));
      });
    }
  }
  List<Todo>? toDoList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (toDoList != null) {
      map['toDoList'] = toDoList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}