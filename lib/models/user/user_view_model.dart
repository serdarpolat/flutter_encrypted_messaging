import 'package:chat_talkr/core/services/data/chat_service.dart';
import 'package:chat_talkr/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class UserViewModel with ChangeNotifier {
  final ChatService _db = GetIt.instance<ChatService>();

  Stream<List<UserModel>> users() => _db.getUsers();
  Stream<List<UserModel>> usersByName(String input) => _db.getUserByName(input);
  Future<UserModel> user(String userUid) => _db.getUser(userUid);
}
