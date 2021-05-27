import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/services/auth/auth_service.dart';
import 'package:chat_talkr/core/services/providers.dart';
import 'package:chat_talkr/core/services/variables.dart';
import 'package:chat_talkr/screens/auth/custom_button.dart';
import 'package:chat_talkr/screens/chats/chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      color: Clr.grayBg,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: hh(context, 120)),
            Container(
              height: 120,
              child: SvgPicture.asset(
                "assets/icons/BrandLogoDark.svg",
              ),
            ),
            SizedBox(height: hh(context, 120)),
            LoginForm(),
            SizedBox(height: hh(context, 24)),
            Text(
              "Don't you have account?",
              style: TextStyle(
                color: Clr.text,
                fontSize: hh(context, 14),
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            TextButton(
              onPressed: () {
                final isLogin =
                    Provider.of<IsLoginPage>(context, listen: false);
                isLogin.changeLoginState(false);
              },
              child: Text(
                "Register",
                style: TextStyle(
                  color: Clr.blue,
                  fontSize: hh(context, 14),
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          paddingHorizontal(
            context,
            child: Container(
              child: TextFormField(
                controller: emailCtrl,
                validator: (value) {
                  String left = value!.split("@").last;
                  if (value.length < 8 ||
                      !value.contains("@") ||
                      !left.contains(".")) {
                    return 'Enter a valid email...';
                  }
                  return null;
                },
                style: TextStyle(
                  fontSize: hh(context, 14),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email Address",
                  hintStyle: TextStyle(
                    color: Clr.textLight,
                    fontSize: hh(context, 14),
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Clr.textLight,
                      width: hh(context, 1),
                    ),
                    borderRadius: BorderRadius.circular(hh(context, 8)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: hh(context, 18)),
          paddingHorizontal(
            context,
            child: Container(
              child: TextFormField(
                controller: passCtrl,
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'Password must be 8 chars or more...';
                  }
                  return null;
                },
                obscureText: true,
                style: TextStyle(
                  fontSize: hh(context, 14),
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Clr.textLight,
                    fontSize: hh(context, 14),
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Clr.textLight,
                      width: hh(context, 1),
                    ),
                    borderRadius: BorderRadius.circular(hh(context, 8)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: hh(context, 18)),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot password?",
              style: TextStyle(
                color: Clr.text,
                fontSize: hh(context, 12),
                fontWeight: FontWeight.w500,
                height: 1.25,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: hh(context, 24)),
          Consumer<LoadingState>(
              builder: (context, LoadingState state, Widget? child) {
            return CustomLoginButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  state.changeLoadingState(true);
                  final auth = AuthService();

                  await auth
                      .signIn(emailCtrl.text, passCtrl.text)
                      .then((user) async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.setBool(Vars.shrFirstlogin, true);

                    print("İn then");
                    if (user != null) {
                      print("İn success");
                      state.changeLoadingState(false);
                      Routing.pushRep(context, Chats());
                    } else {
                      state.changeLoadingState(false);
                      print("User not found");
                    }
                  });
                }
              },
              child: state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    )
                  : Text(
                      "Sign In",
                      style: TextStyle(
                        color: Clr.white,
                        fontSize: hh(context, 16),
                        fontWeight: FontWeight.w500,
                        height: 1.19,
                      ),
                    ),
            );
          })
        ],
      ),
    );
  }
}
