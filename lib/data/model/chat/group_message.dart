class GroupMessage {
  GroupMessage({
    this.id,
    this.senderID,
    this.senderName,
    this.message,
    this.messageDate,
  });

  GroupMessage.fromJson(dynamic json) {
    id = json['_id'];
    senderID = json['sender'];
    senderName = json['senderName'];
    message = json['message'];
    messageDate = json['date'];
  }
  String? id;
  String? senderID;
  String? senderName;
  String? message;
  String? messageDate;
}