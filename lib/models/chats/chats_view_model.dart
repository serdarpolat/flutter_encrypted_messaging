import 'package:chat_talkr/core/services/data/chat_service.dart';
import 'package:chat_talkr/models/chats/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ChatViewModel with ChangeNotifier {
  final ChatService _db = GetIt.instance<ChatService>();

  Stream<List<ChatModel>> chats(String userUid) => _db.getChats(userUid);
}
