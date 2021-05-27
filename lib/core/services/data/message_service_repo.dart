import 'message_service.dart';

class MessageServiceRepo {
  final MessageService _service = MessageService();

  String encryptMessage(String message, String publicKey) =>
      _service.encryptMessage(message, publicKey);
  String decryptMessage(String message, String userPrivateKey) =>
      _service.decryptMessage(message, userPrivateKey);
}
