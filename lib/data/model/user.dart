import 'package:my_family/data/dto/auth/register/helper_selected.dart';

class User {
  String? id;
  String? parentName;
  String? parentEmail;
  String? otherParentEmail;
  String? otherParentName;
  String? familyName;
  int? helpersNo;
  int? childrenNo;
  List<HelperSelected> helpers = [];
  List<String> children = [];
  String? image;

  User(
      {this.id,
        this.parentName,
        this.parentEmail,
        this.otherParentEmail,
        this.otherParentName,
        this.familyName,
        this.helpersNo,
        this.childrenNo,
        this.helpers = const [],
        this.children = const [],
        this.image,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    parentName = json['name'] ?? json['email'].split('@')[0];
    parentEmail = json['email'];
    otherParentEmail = json['otherParentEmail'];
    otherParentName = json['otherParentName'] ?? json['otherParentEmail'].split('@')[0];
    familyName = json['familyUserName'];
    helpersNo = json['helpersNo'];
    childrenNo = json['childrenNo'];
    helpers = (json['helpers'] as List<dynamic>?)?.map((helper) => HelperSelected.fromJson(helper)).toList()??[];
    children = (json['children'] as List<dynamic>?)?.map((child) => child.toString()).toList()??[];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = parentName;
    data['email'] = parentEmail;
    data['otherParentEmail'] = otherParentEmail;
    data['otherParentName'] = otherParentName;
    data['familyUserName'] = familyName;
    data['helpersNo'] = helpersNo;
    data['childrenNo'] = childrenNo;
    data['helpers'] = helpers.map((e) => e.toJson()).toList();
    data['children'] = children;
    data['image'] = image;
    return data;
  }
}