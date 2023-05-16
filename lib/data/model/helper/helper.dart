class Helper {
  String? id;
  String? image;
  String? name;
  String? email;
  List<int> permissions = [];

  Helper({
    this.id,
    this.image,
    this.name,
    this.email,
    this.permissions = const [],
  });

  Helper.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'] ?? json['email'].split('@')[0];
    email = json['email'];
    permissions = List.from(json['permissions']??[]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['permissions'] = permissions;
    return data;
  }
}
