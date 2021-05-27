import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String id;
  List<dynamic> message;
  String senderId;
  Timestamp senttime;
  String status;

  MessageModel({
    required this.id,
    required this.message,
    required this.senderId,
    required this.senttime,
    required this.status,
  });

  factory MessageModel.fromSnapshot(DocumentSnapshot snapshot) {
    return MessageModel(
      id: snapshot.id,
      message: snapshot["message"],
      senderId: snapshot["senderId"],
      senttime: snapshot["senttime"],
      status: snapshot["status"],
    );
  }
}
