import 'package:my_family/data/model/user.dart';

class Auth {
  bool? success;
  String? token;
  User? user;

  Auth({this.success, this.token});

  Auth.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    user = json['record'] != null ? User.fromJson(json['record']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['token'] = token;
    if (user != null) {
      data['record'] = user!.toJson();
    }
    return data;
  }
}