class Assignment {
  Assignment({
      this.title, 
      this.description, 
      this.dueDate, 
      this.done, 
      this.image,});

  Assignment.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    dueDate = json['dueDate'];
    done = json['done'];
    image = json['image'];
  }
  String? title;
  String? description;
  String? dueDate;
  bool? done;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['dueDate'] = dueDate;
    map['done'] = done;
    map['image'] = image;
    return map;
  }

}