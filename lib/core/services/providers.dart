import 'package:encryption/encryption.dart';
import 'package:flutter/material.dart';

class LoadingState with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void changeLoadingState(bool state) {
    _isLoading = state;
    notifyListeners();
  }
}

class IsLoginPage with ChangeNotifier {
  bool _isLogin = false;
  bool get isLogin => _isLogin;

  void changeLoginState(bool state) {
    _isLogin = state;
    notifyListeners();
  }
}

class UserPhotoState with ChangeNotifier {
  int _img = 0;
  int get img => _img;

  void changePhotoState(int i) {
    _img = i;
    notifyListeners();
  }
}

class ProfileAlertState with ChangeNotifier {
  bool _hasAlert = false;
  bool get hasAlert => _hasAlert;

  void changeAlertState() {
    _hasAlert = !_hasAlert;
    notifyListeners();
  }
}

class SearchQuery with ChangeNotifier {
  String _title = "";
  String get title => _title;

  void changeSearchTitle(String t) {
    _title = t;
    notifyListeners();
  }
}

class LastMessage with ChangeNotifier {
  String _msg = "";
  String get msg => _msg;

  encMessage(String message, String pubKey) async {
    var publicKey = RSAPublicKey.fromString(pubKey);
    var encrypted = publicKey.encrypt(message);

    _msg = encrypted;

    notifyListeners();
  }
}

class AvatarScreenOpen with ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;

  void changeState() {
    _isOpen = !_isOpen;
    notifyListeners();
  }
}
