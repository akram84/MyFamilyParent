import 'package:my_family/core/enums/member_type.dart';

class AddMemberDTO{
  AddMemberDTO({required this.memberType, required this.members});

  final MemberType memberType;
  List<Member> members;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['memberType'] = memberType.name;
    data['membersNum'] = members.length;
    data['members'] = members.map((e) => e.toJson()).toList();
    return data;
  }
}

class Member{
  String? email;
  List<int> permissions = [];

  Member({this.email, required this.permissions});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    if(permissions.isNotEmpty) data['permissions'] = permissions;
    return data;
  }
}