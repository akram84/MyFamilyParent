import '../../repository/user_repository.dart';

class AddTaskDTO{
  AddTaskDTO({required this.childId, required this.tasks, this.date});

  final String childId;
  final String? date;
  final List<Task> tasks;

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map['child'] = childId;
    map['familyUserName'] = UserRepository.getUser?.familyName;
    map['date'] = date??DateTime.now().toString();
    map['tasks'] = tasks.map((task) => task.toJson()).toList();
    return map;
  }
}

class Task{
  Task({required this.task});

  final String task;

  Map<String, dynamic> toJson() => {'task': task};
}