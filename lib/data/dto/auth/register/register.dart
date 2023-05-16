import 'child_selected.dart';
import 'helper_selected.dart';

class RegisterDTO {
  RegisterDTO({
    required this.language,
    required this.parentName,
    required this.parentEmail,
    required this.otherParentName,
    required this.otherParentEmail,
    required this.password,
    required this.familyName,
    required this.familyPassword,
    required this.helpersNo,
    required this.childrenNo,
    required this.helpers,
    required this.children,
  });

  final String language;
  final String parentName;
  final String parentEmail;
  final String otherParentName;
  final String otherParentEmail;
  final String password;
  final String familyName;
  final String familyPassword;
  final String helpersNo;
  final String childrenNo;
  List<HelperSelected> helpers;
  List<ChildSelected> children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['language'] = language;
    map['name'] = parentName;
    map['email'] = parentEmail;
    map['otherParentName'] = otherParentName.isEmpty ? parentName : otherParentName;
    map['otherParentEmail'] = otherParentEmail.isEmpty ? parentEmail : otherParentEmail;
    map['password'] = password;
    map['familyUserName'] = familyName;
    map['familyPassword'] = familyPassword;
    map['helpersNo'] = helpersNo;
    map['childrenNo'] = childrenNo;
    map['helpers'] = helpers.map((helper) => helper.toJson()).toList();
    map['children'] = children.map((child) => child.email).toList();
    return map;
  }
}
