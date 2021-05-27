import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 0)
class UserSettings {
  @HiveField(0)
  String fName;

  @HiveField(1)
  String lName;

  @HiveField(2)
  bool isActive;

  @HiveField(3)
  String photoUrl;

  @HiveField(4)
  String publicKey;

  @HiveField(5)
  String privateKey;

  @HiveField(6)
  String uuid;

  UserSettings({
    required this.fName,
    required this.lName,
    required this.isActive,
    required this.photoUrl,
    required this.publicKey,
    required this.privateKey,
    required this.uuid,
  });

  // Map<String, dynamic> toMap(UserSettings settings) {
  //   Map<String, dynamic> myMap = Map();
  //   myMap['fName'] = fName;
  //   myMap['lName'] = lName;
  //   myMap['isActive'] = isActive;
  //   myMap['photoUrl'] = photoUrl;
  //   myMap['publicKey'] = publicKey;
  //   myMap['privateKey'] = privateKey;
  //   myMap['uuid'] = uuid;

  //   return myMap;
  // }

  factory UserSettings.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    UserSettings userModel = UserSettings(
      fName: snapshot['fName'],
      lName: snapshot['lName'],
      isActive: snapshot['isActive'],
      photoUrl: snapshot['photoUrl'],
      publicKey: snapshot['publicKey'],
      privateKey: snapshot['privateKey'],
      uuid: snapshot['uuid'],
    );

    return userModel;
  }
}
