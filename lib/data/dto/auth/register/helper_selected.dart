

class HelperSelected{
  String? email;
  List<int> permissions = [];

  HelperSelected({this.email, required this.permissions});

  HelperSelected.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    permissions = [];
    json['permissions']?.forEach((p) => permissions.add(p));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['permissions'] = permissions;
    return data;
  }
}