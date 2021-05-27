import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String id;
  String fName;
  String lName;
  String userImg;
  List<dynamic> members;
  Timestamp createdAt;

  ChatModel({
    required this.id,
    required this.fName,
    required this.lName,
    required this.userImg,
    required this.members,
    required this.createdAt,
  });

  factory ChatModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ChatModel(
      id: snapshot.id,
      fName: snapshot["fName"],
      lName: snapshot["lName"],
      userImg: snapshot["userImg"],
      members: snapshot["members"],
      createdAt: snapshot["createdAt"],
    );
  }
}
