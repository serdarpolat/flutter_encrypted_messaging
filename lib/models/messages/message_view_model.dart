import 'package:chat_talkr/core/services/data/chat_service.dart';
import 'package:chat_talkr/models/messages/message_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class MessageViewModel with ChangeNotifier {
  final ChatService _db = GetIt.instance<ChatService>();

  Stream<List<MessageModel>> messages(String chatId, bool descending) =>
      _db.getMessages(chatId, descending);
}
