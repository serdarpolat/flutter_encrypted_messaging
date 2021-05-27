import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/services/providers.dart';
import 'package:chat_talkr/core/services/service_index.dart';
import 'package:chat_talkr/screens/auth/preauth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertButtons extends StatelessWidget {
  final double alertWidth;
  final double alertHeight;

  const AlertButtons({
    Key? key,
    required this.alertWidth,
    required this.alertHeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: alertWidth - ww(context, 32),
      height: alertHeight / 5,
      child: Row(
        children: [
          alertButton(
            context,
            alertHeight,
            onTap: () {
              final alertState =
                  Provider.of<ProfileAlertState>(context, listen: false);

              alertState.changeAlertState();
            },
            title: "Never",
          ),
          SizedBox(width: ww(context, 16)),
          alertButton(
            context,
            alertHeight,
            onTap: () async {
              final auth = AuthRepository();

              auth.signOut().whenComplete(() async {
                Routing.pushRep(context, Preauth());
              });
            },
            title: "Let Me Out",
          ),
        ],
      ),
    );
  }
}
// authService.signOut().whenComplete(
//       () => Routing.pushRep(context, LoginScreen()));

Widget alertButton(BuildContext context, double alertHeight,
        {required Function()? onTap, required String title}) =>
    Expanded(
      child: MaterialButton(
        onPressed: onTap,
        height: alertHeight / 5,
        color: Clr.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ww(context, 8))),
        child: Text(
          title,
          style: TextStyle(
            color: Clr.white,
            fontWeight: FontWeight.w700,
            fontSize: hh(context, 16),
          ),
        ),
      ),
    );
