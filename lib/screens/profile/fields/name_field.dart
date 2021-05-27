import 'package:chat_talkr/core/components/component_index.dart';
import 'package:flutter/material.dart';

Widget xnameField(BuildContext context,
        {required TextEditingController nameCtrl}) =>
    paddingHorizontal(
      context,
      child: TextField(
        controller: nameCtrl,
        style: TextStyle(
          fontSize: hh(context, 14),
          fontWeight: FontWeight.w500,
          color: Clr.text,
          height: 1.5,
        ),
        decoration: InputDecoration(
          hintText: "hint",
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
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Clr.textLight,
              width: hh(context, 1),
            ),
            borderRadius: BorderRadius.circular(hh(context, 8)),
          ),
        ),
      ),
    );
