import '../children/child.dart';
import 'subjects.dart';

class Study {
  Study({
      this.child, 
      this.subjects,});

  Study.fromJson(dynamic json) {
    child = json['child'] != null ? Child.fromJson(json['child']) : null;
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subject.fromJson(v));
      });
    }
  }
  Child? child;
  List<Subject>? subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (child != null) {
      map['child'] = child?.toJson();
    }
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}