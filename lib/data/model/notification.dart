class Notification {
  Notification({
      this.id, 
      this.text,
      this.date, 
      this.type, 
      });

  Notification.fromJson(dynamic json) {
    id = json['_id'];
    text = json['text'];
    date = json['date'];
    type = json['type'];
  }
  String? id;
  String? text;
  String? date;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['text'] = text;
    map['date'] = date;
    map['type'] = type;
    return map;
  }
}