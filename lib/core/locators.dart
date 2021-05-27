import 'package:chat_talkr/core/services/data/chat_service.dart';
import 'package:chat_talkr/models/chats/chats_view_model.dart';
import 'package:chat_talkr/models/messages/message_view_model.dart';
import 'package:chat_talkr/models/user/user_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setUpLocators() {
  getIt.registerLazySingleton(() => ChatService());

  getIt.registerFactory(() => ChatViewModel());
  getIt.registerFactory(() => MessageViewModel());
  getIt.registerFactory(() => UserViewModel());
}
