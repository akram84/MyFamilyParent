class Group {
  Group({
      this.id, 
      this.groupName,
      this.groupDescription,
      this.image,
      this.lastMessage,
      this.lastMessageDate,
  });

  Group.fromJson(dynamic json) {
    id = json['_id'];
    groupName = json['groupName'];
    groupDescription = json['groupDescription'];
    image = json['image'];

    lastMessage = json['lastMessage'];
    lastMessageDate = json['lastMessageDate'];
  }

  String? id;
  String? groupName;
  String? groupDescription;
  String? image;

  String? lastMessage;
  String? lastMessageDate;

}