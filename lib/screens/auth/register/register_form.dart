import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/services/service_index.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:chat_talkr/screens/auth/custom_button.dart';
import 'package:chat_talkr/screens/auth/fields.dart';
import 'package:chat_talkr/screens/chats/chats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encryption/encryption.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference usersRef =
      FirebaseFirestore.instance.collection(Vars.userTable);
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController passAgainCtrl = TextEditingController();
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    emailCtrl.dispose();
    passCtrl.dispose();
    passAgainCtrl.dispose();
    fNameCtrl.dispose();
    lNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          paddingHorizontal(
            context,
            child: Row(
              children: [
                nameField(context,
                    ctrl: fNameCtrl,
                    hintText: "First Name",
                    width: (s.width - ww(context, 44)) / 2),
                SizedBox(width: ww(context, 12)),
                nameField(context,
                    ctrl: lNameCtrl,
                    hintText: "Last Name",
                    width: (s.width - ww(context, 44)) / 2),
              ],
            ),
          ),
          SizedBox(height: hh(context, 18)),
          emailField(
            context,
            s,
            emailCtrl: emailCtrl,
          ),
          SizedBox(height: hh(context, 18)),
          passField(
            context,
            s,
            passCtrl: passCtrl,
          ),
          SizedBox(height: hh(context, 18)),
          passAgainField(context, s,
              passAgainCtrl: passAgainCtrl, passCtrl: passCtrl),
          SizedBox(height: hh(context, 48)),
          Consumer<LoadingState>(
            builder: (
              context,
              LoadingState state,
              Widget? child,
            ) {
              return CustomLoginButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();

                    state.changeLoadingState(true);
                    final auth = AuthRepository();

                    final keyPair = RSAKeypair.fromRandom();
                    final privateKey = keyPair.privateKey.toString();
                    final publicKey = keyPair.publicKey.toString();

                    // final warningState =
                    //     Provider.of<AuthWarningState>(context, listen: false);

                    await auth
                        .register(emailCtrl.text, passCtrl.text)
                        .then((user) async {
                      if (user != null) {
                        await usersRef.add({
                          'fName': fNameCtrl.text,
                          'lName': lNameCtrl.text,
                          'isActive': true,
                          'photoUrl': "1.svg",
                          'publicKey': publicKey,
                          'uuid': user.uid,
                        }).whenComplete(() async {
                          var profileBox = Hive.box<UserSettings>('profile');

                          var userSettings = UserSettings(
                            fName: fNameCtrl.text,
                            lName: lNameCtrl.text,
                            isActive: true,
                            photoUrl: "1.svg",
                            publicKey: publicKey,
                            privateKey: privateKey,
                            uuid: user.uid,
                          );

                          await profileBox.clear();

                          await profileBox
                              .add(userSettings)
                              .whenComplete(() async {
                            await preferences.setBool(Vars.shrFirstlogin, true);

                            state.changeLoadingState(false);

                            Routing.pushRep(context, Chats());
                          });
                        });
                      } else {
                        state.changeLoadingState(false);
                        print("Register Failed");
                        // warningState.changeWarningState(true);
                      }
                    });
                  }
                },
                child: state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Clr.white,
                        ),
                      )
                    : Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Clr.white,
                            fontSize: hh(context, 16),
                            fontWeight: FontWeight.w500,
                            height: 1.19,
                          ),
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
