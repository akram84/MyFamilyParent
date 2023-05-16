class Child {
  late String id;
  late String name;
  late String email;
  String? image;



  Child.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'] ?? json['email'].split('@')[0];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    return data;
  }
}