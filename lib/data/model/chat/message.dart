class Message {
  Message({
    this.id,
    this.senderID,
    this.message,
    this.messageDate,
  });

  Message.fromJson(dynamic json) {
    id = json['_id'];
    senderID = json['sender'];
    message = json['message'];
    messageDate = json['date'];
  }
  String? id;
  String? senderID;
  String? message;
  String? messageDate;
}