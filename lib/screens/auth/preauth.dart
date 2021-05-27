import 'package:chat_talkr/core/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'register/register.dart';

class Preauth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, IsLoginPage state, Widget? child) {
      return Scaffold(
        body: state.isLogin ? Login() : Register(),
      );
    });
  }
}
