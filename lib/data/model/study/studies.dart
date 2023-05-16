import 'study.dart';

class Studies {
  Studies({
      this.study,});

  Studies.fromJson(dynamic json) {
    if (json['study'] != null) {
      study = [];
      json['study'].forEach((v) {
        study?.add(Study.fromJson(v));
      });
    }
  }
  List<Study>? study;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (study != null) {
      map['study'] = study?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}