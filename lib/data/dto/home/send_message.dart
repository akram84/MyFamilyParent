class SendMessageDTO{
  SendMessageDTO({
    this.chatID,
    this.recieverID,
    this.receiverName,
    this.receiverImage,
    this.senderID,
    this.senderName,
    this.senderImage,
    this.messageDate,
    this.message,
 });

  final String? chatID;

  final String? recieverID;
  final String? receiverName;
  final String? receiverImage;

  final String? senderID;
  final String? senderName;
  final String? senderImage;

  final String? messageDate;
  final String? message;

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map["chatId"] = chatID;

    map["receiver"] = recieverID;
    map["receiverName"] = receiverName;
    map["receiverImage"] = receiverImage;

    map["sender"] = senderID;
    map["senderName"] = senderName;
    map["senderImage"] = senderImage;

    map["message"] = message;
    map["messageDate"] = messageDate;
    return map;
  }
}