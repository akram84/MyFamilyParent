class Suggestions {
  Suggestions({
      this.suggestion, 
      this.percentage, 
      this.id,});

  Suggestions.fromJson(dynamic json) {
    suggestion = json['suggestion'];
    percentage = json['percentage'];
    id = json['_id'];
  }
  String? suggestion;
  num? percentage;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['suggestion'] = suggestion;
    map['percentage'] = percentage;
    map['_id'] = id;
    return map;
  }

}