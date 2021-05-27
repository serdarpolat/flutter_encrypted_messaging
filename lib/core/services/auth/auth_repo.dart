import 'package:chat_talkr/core/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthService _auth = AuthService();

  Future<User?> register(String email, String pass) async =>
      await _auth.register(email, pass);

  Future<User?> signIn(String email, String pass) async =>
      await _auth.signIn(email, pass);

  Future<void> signOut() async => await _auth.signOut();
}
