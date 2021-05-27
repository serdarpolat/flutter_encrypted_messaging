import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> register(String email, String pass) async {
    User? user;

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      user = userCredential.user!;

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> signIn(String email, String pass) async {
    User? user;
    try {
      user =
          (await _auth.signInWithEmailAndPassword(email: email, password: pass))
              .user;

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        print('No user found for that email.');
        return null;
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
