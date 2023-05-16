import 'assignment.dart';

class Subject {
  Subject({
      this.subject, 
      this.assignments = const [],});

  Subject.fromJson(dynamic json) {
    subject = json['subject'];
    assignments = (json['Assignments'] as List?)?.map((e) => Assignment.fromJson(e)).toList()??[];
  }
  String? subject;
  List<Assignment> assignments = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subject'] = subject;
    map['Assignments'] = assignments.map((v) => v.toJson()).toList();
    return map;
  }
}