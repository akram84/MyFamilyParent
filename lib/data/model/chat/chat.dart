import 'package:my_family/data/repository/user_repository.dart';

class Chat {
  Chat({
    this.id,
    this.lastMessage,
    this.lastMessageDate,
    this.recieverID,
    this.receiverName,
    this.receiverImage,
    this.senderID,
    this.senderName,
    this.senderImage,

  });

  Chat.fromJson(dynamic json) {
    id = json['_id'];

    recieverID = json["receiver"];
    receiverName = json["receiverName"];
    receiverImage = json["receiverImage"];

    senderID = json["sender"];
    senderName = json["senderName"];
    senderImage = json["senderImage"];

    if(json['sender'] == UserRepository.getUser!.id){
      senderID = json["receiver"];
      senderName = json["receiverName"];
      senderImage = json["receiverImage"];
    }

    lastMessage = json['lastMessage'];
    lastMessageDate = json['lastMessageDate'];
  }

  String? id;
  String? lastMessage;
  String? lastMessageDate;

  String? recieverID;
  String? receiverName;
  String? receiverImage;

  String? senderID;
  String? senderName;
  String? senderImage;
}