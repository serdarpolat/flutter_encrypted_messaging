import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/services/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'register_form.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      color: Clr.grayBg,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: hh(context, 90)),
                Container(
                  height: 80,
                  child: SvgPicture.asset(
                    "assets/icons/BrandLogoDark.svg",
                  ),
                ),
                SizedBox(height: hh(context, 64)),
                RegisterForm(),
                SizedBox(height: hh(context, 24)),
                Column(
                  children: [
                    Text(
                      "Already have account?",
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
                        isLogin.changeLoginState(true);
                      },
                      child: Text(
                        "Login",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
