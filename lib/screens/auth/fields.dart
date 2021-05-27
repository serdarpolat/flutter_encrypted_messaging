import 'package:chat_talkr/core/components/component_index.dart';
import 'package:flutter/material.dart';

Widget nameField(BuildContext context,
        {required TextEditingController ctrl,
        required String hintText,
        required double width}) =>
    Container(
      width: width,
      child: TextFormField(
        controller: ctrl,
        validator: (value) {
          if (value == null || value.length < 3) {
            return 'Enter $hintText';
          }
          return null;
        },
        style: TextStyle(
          fontSize: hh(context, 14),
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: hintText,
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
    );

Widget lNameField(BuildContext context, Size s,
        {required TextEditingController lNameCtrl}) =>
    Expanded(
      child: Container(
        child: TextFormField(
          controller: lNameCtrl,
          validator: (value) {
            if (value == null || value.length < 3) {
              return 'Enter Last Name';
            }
            return null;
          },
          style: TextStyle(
            fontSize: hh(context, 14),
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: "Last Name",
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
    );

Widget emailField(BuildContext context, Size s,
        {required TextEditingController emailCtrl}) =>
    paddingHorizontal(
      context,
      child: TextFormField(
        controller: emailCtrl,
        validator: (value) {
          String left = value!.split("@").last;
          if (value.length < 8 || !value.contains("@") || !left.contains(".")) {
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
          hintText: "Email address",
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
    );

Widget passField(BuildContext context, Size s,
        {required TextEditingController passCtrl}) =>
    paddingHorizontal(
      context,
      child: TextFormField(
        controller: passCtrl,
        validator: (value) {
          if (value == null || value.length < 8) {
            return 'Password must be 8 chars or more...';
          }
          return null;
        },
        style: TextStyle(
          fontSize: hh(context, 14),
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
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
    );

Widget passAgainField(BuildContext context, Size s,
        {required TextEditingController passAgainCtrl,
        required TextEditingController passCtrl}) =>
    paddingHorizontal(
      context,
      child: TextFormField(
        controller: passAgainCtrl,
        validator: (value) {
          if (value == null || value.length < 7) {
            return 'Re-type your password...';
          }
          if (value != passCtrl.text) return 'Passwords are not match';
          return null;
        },
        style: TextStyle(
          fontSize: hh(context, 14),
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Re-type password",
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
    );
