import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/services/providers.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:chat_talkr/screens/auth/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'complete_button.dart';
import 'fields/status_field.dart';
import 'logout/logout_alert.dart';
import 'profile_appbar.dart';

class ProfilePage extends StatefulWidget {
  final UserSettings userSettings;

  const ProfilePage({Key? key, required this.userSettings}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    fNameCtrl.text = widget.userSettings.fName;
    lNameCtrl.text = widget.userSettings.lName;
    print(widget.userSettings.photoUrl);
    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        color: Clr.white,
        child: Stack(
          children: [
            Container(
              width: s.width,
              height: s.height,
              child: SingleChildScrollView(
                child: Container(
                  width: s.width,
                  height: s.height,
                  child: Column(
                    children: [
                      SizedBox(height: hh(context, 139)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(ww(context, 200)),
                        child: Container(
                          width: ww(context, 200),
                          height: ww(context, 200),
                          child: SvgPicture.asset(
                              "assets/images/user/${widget.userSettings.photoUrl}"),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(height: hh(context, 50)),
                      nameField(context,
                          ctrl: fNameCtrl,
                          hintText: "First Name",
                          width: (s.width - 32)),
                      SizedBox(height: hh(context, 18)),
                      nameField(context,
                          ctrl: lNameCtrl,
                          hintText: "Last Name",
                          width: (s.width - 32)),
                      SizedBox(height: hh(context, 18)),
                      statusField(s, context),
                      SizedBox(height: hh(context, 91)),
                      completeButton(context, s),
                    ],
                  ),
                ),
              ),
            ),
            profileAppbar(
              context,
              s,
              onPressed: () {
                final alertState =
                    Provider.of<ProfileAlertState>(context, listen: false);

                alertState.changeAlertState();
              },
            ),
            Consumer<ProfileAlertState>(
                builder: (context, alertState, Widget? child) {
              return AnimatedPositioned(
                duration: Duration(milliseconds: 240),
                curve: Curves.easeInOutBack,
                top: alertState.hasAlert ? 0 : s.height,
                left: 0,
                child: AnimatedOpacity(
                    duration: Duration(milliseconds: 120),
                    opacity: alertState.hasAlert ? 1 : 0,
                    child: LogoutAlert()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
