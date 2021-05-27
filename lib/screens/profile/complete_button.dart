import 'package:chat_talkr/core/components/component_index.dart';
import 'package:flutter/material.dart';

Widget completeButton(BuildContext context, Size s) => paddingHorizontal(
      context,
      child: MaterialButton(
        onPressed: () {},
        color: Clr.blue,
        minWidth: s.width,
        elevation: 1,
        height: hh(context, 54),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(hh(context, 8))),
        child: Text(
          "Complete",
          style: TextStyle(
            color: Clr.white,
            fontSize: hh(context, 18),
            fontWeight: FontWeight.w500,
            height: 1.22,
          ),
        ),
      ),
    );
