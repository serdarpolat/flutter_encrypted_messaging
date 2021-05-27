import 'package:encryption/encryption.dart';

class MessageService {
  String encryptMessage(String message, String publicKey) {
    return RSAPublicKey.fromString(publicKey).encrypt(message);
  }

  String decryptMessage(String message, String userPrivateKey) {
    return RSAPrivateKey.fromString(userPrivateKey).decrypt(message);
  }
}
