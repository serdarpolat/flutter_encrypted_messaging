import 'package:chat_talkr/models/chats/chat_model.dart';
import 'package:chat_talkr/models/messages/message_model.dart';
import 'package:chat_talkr/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatModel>> getChats(String userUid) {
    var query =
        _firestore.collection("chats").where("members", arrayContains: userUid);

    return query
        .snapshots()
        .map((ev) => ev.docs.map((e) => ChatModel.fromSnapshot(e)).toList());
  }

  Stream<List<MessageModel>> getMessages(String chatId, bool descending) {
    var query = _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy("senttime", descending: descending);

    return query
        .snapshots()
        .map((ev) => ev.docs.map((e) => MessageModel.fromSnapshot(e)).toList());
  }

  Stream<List<UserModel>> getUsers() {
    var query = _firestore.collection("users");

    return query
        .snapshots()
        .map((ev) => ev.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  Stream<List<UserModel>> getUserByName(String input) {
    var query = _firestore.collection("users").where("fName", isEqualTo: input);

    return query
        .snapshots()
        .map((ev) => ev.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  Future<UserModel> getUser(String userUid) async {
    late UserModel user;
    var query =
        _firestore.collection("users").where("uuid", isEqualTo: userUid);

    var ada = query
        .snapshots()
        .map((event) => UserModel.fromSnapshot(event.docs.first));

    await ada.first.then((value) {
      user = value;
    });

    return user;
  }
}
