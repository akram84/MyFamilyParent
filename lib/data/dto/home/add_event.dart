import '../../repository/user_repository.dart';

class AddEventDTO {
  AddEventDTO({
    required this.childId,
    required this.eventName,
    this.eventNote,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.remindsMe,
  });

  final String childId;
  final String eventName;
  final String? eventNote;
  final DateTime date;
  final String startTime;
  final String endTime;
  final bool? remindsMe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['child'] = childId;
    map['eventName'] = eventName;
    map['description'] = eventNote;
    map['Date'] = date.toString();
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['familyUserName'] = UserRepository.getUser?.familyName;
    // if (remindsMe != null) map['remindsMe'] = remindsMe;
    return map;
  }
}
