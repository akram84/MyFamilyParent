class Event {
  Event({
    required this.id,
    required this.childID,
    required this.eventName,
    required this.note,
    required this.startTime,
    required this.endTime,
  });

  String? id;
  String? childID;
  String? eventName;
  String? note;
  String? startTime;
  String? endTime;

  Event.fromJson(dynamic json) {
    id = json['_id'];
    childID = json['child'];
    eventName = json['eventName'];
    note = json['description'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }
}
