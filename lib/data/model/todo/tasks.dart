class Task {
  Task({
      this.task, 
      this.done, 
      this.id,});

  Task.fromJson(dynamic json) {
    task = json['task'];
    done = json['done'];
    id = json['_id'];
  }
  String? task;
  bool? done;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['task'] = task;
    map['done'] = done;
    map['_id'] = id;
    return map;
  }

}