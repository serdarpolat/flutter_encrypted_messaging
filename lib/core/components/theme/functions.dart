import 'package:chat_talkr/core/services/data/message_service_repo.dart';
import 'package:chat_talkr/models/messages/message_model.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum SharedKeys {
  PRIVATE,
  PUBLIC,
  ISAUTH,
}

class Routing {
  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static push(BuildContext context, Widget child) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => child),
    );
  }

  static pushRep(BuildContext context, Widget child) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => child),
    );
  }
}

String getTime(Timestamp senttime) {
  DateTime time = senttime.toDate();
  String date = "";

  if (time.day == DateTime.now().day) {
    date = time.hour.toString() + ":" + time.minute.toString();
  } else {
    date = time.toString().split(" ").first.split("-")[2] +
        "/" +
        time.toString().split(" ").first.split("-")[1];
  }

  return date;
}

String getMsg(MessageModel message, UserSettings user) {
  MessageServiceRepo _msgRepo = MessageServiceRepo();
  return message.senderId == user.uuid
      ? _msgRepo.decryptMessage(message.message[1], user.privateKey)
      : _msgRepo.decryptMessage(message.message[0], user.privateKey);
}

int unreadCount(List<MessageModel> messages, String uuid) {
  int count = 0;
  for (var i = 0; i < messages.length; i++) {
    if (messages[i].senderId != uuid) {
      if (messages[i].status == 'unread') count += 1;
    }
  }

  return count;
}

setMessageAsRead(String chatId, String myUid) async {
  var msgDocs = FirebaseFirestore.instance
      .collection('chats')
      .doc(chatId)
      .collection('messages')
      .where('senderId', isNotEqualTo: myUid)
      .snapshots();

  await msgDocs.forEach((el) async {
    List<DocumentSnapshot> docs = el.docs;

    for (var doc in docs) {
      await doc.reference.update({'status': 'read'});
    }
  });
}
