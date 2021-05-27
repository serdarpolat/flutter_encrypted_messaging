import 'dart:async';

import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/services/providers.dart';
import 'package:chat_talkr/core/services/variables.dart';
import 'package:chat_talkr/screens/auth/preauth.dart';
import 'package:chat_talkr/screens/chats/chats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    Timer(Duration(seconds: 3), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool firstLaunch = preferences.getBool(Vars.shrFirstlogin) ?? false;
      FirebaseAuth auth = FirebaseAuth.instance;

      if (firstLaunch) {
        if (auth.currentUser == null) {
          final isLogin = Provider.of<IsLoginPage>(context, listen: false);
          isLogin.changeLoginState(true);
          Routing.pushRep(context, Preauth());
        } else {
          Routing.pushRep(context, Chats());
        }
      } else {
        Routing.pushRep(context, Preauth());
      }
    });

    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        color: Clr.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset(
              "assets/icons/Logo.svg",
              width: s.width / 5,
            ),
            SizedBox(height: hh(context, 24)),
            SvgPicture.asset(
              "assets/icons/BrandLogo.svg",
              width: s.width / 3,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "by ",
                  style: TextStyle(
                    color: Clr.white.withOpacity(0.6),
                    fontSize: hh(context, 16),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "serdar",
                  style: TextStyle(
                    color: Clr.white,
                    fontSize: hh(context, 16),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "polat",
                  style: TextStyle(
                    color: Clr.white,
                    fontSize: hh(context, 16),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(height: hh(context, 24)),
          ],
        ),
      ),
    );
  }
}
