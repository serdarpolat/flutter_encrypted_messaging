import 'package:chat_talkr/core/components/component_index.dart';
import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color bgColor;
  final Widget child;

  CustomLoginButton(
      {required this.onPressed, this.bgColor = Clr.blue, required this.child});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return paddingHorizontal(
      context,
      child: MaterialButton(
        onPressed: onPressed,
        color: bgColor,
        minWidth: s.width,
        elevation: 1,
        height: hh(context, 60),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(hh(context, 8))),
        child: child,
      ),
    );
  }
}

Widget customButton(BuildContext context, Size s,
        {required Widget child,
        required VoidCallback onPressed,
        Color bgColor = Clr.blue}) =>
    paddingHorizontal(
      context,
      child: MaterialButton(
        onPressed: onPressed,
        color: bgColor,
        minWidth: s.width,
        elevation: 1,
        height: hh(context, 60),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(hh(context, 8))),
        child: child,
      ),
    );
