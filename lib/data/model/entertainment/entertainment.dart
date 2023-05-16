import 'suggestions.dart';

class Entertainment {

  Entertainment.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    if (json['suggestions'] != null) {
      suggestions = [];
      json['suggestions'].forEach((v) {
        suggestions.add(Suggestions.fromJson(v));
      });
    }
  }
  String? id;
  String? title;
  List<Suggestions> suggestions = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['suggestions'] = suggestions.map((v) => v.toJson()).toList();
    return map;
  }

}