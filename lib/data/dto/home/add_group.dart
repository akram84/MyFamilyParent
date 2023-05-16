import 'package:my_family/data/repository/user_repository.dart';

class CreateGroupDTO {
  CreateGroupDTO({
    required this.parentID,
    required this.groupName,
    required this.groupDescription,
    required this.children,
    required this.helpers,
  });

  final String parentID;
  final String groupName;
  final String groupDescription;
  final List<String> children;
  final List<String> helpers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["parentID"] = parentID;
    map['familyUserName'] = UserRepository.getUser?.familyName;
    map["groupName"] = groupName;
    map["groupDescription"] = groupDescription;
    map["lastMessage"] = groupDescription;
    map["children"] = children.map((e) => {'child': e}).toList();
    map["helpers"] = helpers.map((e) => {'helper': e}).toList();
    return map;
  }
}