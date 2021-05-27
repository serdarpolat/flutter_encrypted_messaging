import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String fName;

  @HiveField(1)
  String lName;

  @HiveField(2)
  bool isActive;

  @HiveField(3)
  DateTime lastSeen;

  @HiveField(4)
  String photoUrl;

  @HiveField(5)
  String publicKey;

  @HiveField(6)
  String uuid;

  UserModel({
    required this.fName,
    required this.lName,
    required this.isActive,
    required this.lastSeen,
    required this.photoUrl,
    required this.publicKey,
    required this.uuid,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    UserModel userModel = UserModel(
      fName: snapshot['fName'],
      lName: snapshot['lName'],
      isActive: snapshot['isActive'],
      lastSeen: snapshot['lastSeen'].toDate(),
      photoUrl: snapshot['photoUrl'],
      publicKey: snapshot['publicKey'],
      uuid: snapshot['uuid'],
    );

    return userModel;
  }
}
