import 'package:my_family/data/model/children/child.dart';

import 'tasks.dart';

class Todo {
  Todo({
      this.child,
      this.tasks, 
      this.id,});

  Todo.fromJson(dynamic json) {
    if (json['child'] != null) {
      child = Child.fromJson(json['child']);
    }
    date = json['date'];
    if (json['tasks'] != null) {
      tasks = [];
      json['tasks'].forEach((v) {
        tasks?.add(Task.fromJson(v));
      });
    }
    id = json['_id'];
  }
  Child? child;
  List<Task>? tasks;
  String? id;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['child'] = child?.toJson();
    map['date'] = date;
    if (tasks != null) {
      map['tasks'] = tasks?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    return map;
  }

}