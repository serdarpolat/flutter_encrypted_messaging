import 'package:chat_talkr/core/components/component_index.dart';
import 'package:flutter/material.dart';

Widget messageBubble(BuildContext context, Size s,
        {required String message, required bool isMine}) =>
    paddingHorizontal(
      context,
      child: Container(
        width: s.width,
        alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: hh(context, 9)),
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: ww(context, 240)),
            child: Container(
              padding: EdgeInsets.all(ww(context, 10)),
              child: Text(
                message,
                textAlign: isMine ? TextAlign.right : TextAlign.left,
                style: TextStyle(
                  fontSize: hh(context, 14),
                  color: isMine ? Clr.white : Clr.text,
                  fontWeight: FontWeight.w500,
                  height: 1.18,
                ),
              ),
              decoration: BoxDecoration(
                color: isMine ? Clr.blue : Clr.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(ww(context, isMine ? 0 : 24)),
                  topLeft: Radius.circular(ww(context, isMine ? 24 : 0)),
                  bottomRight: Radius.circular(ww(context, 24)),
                  bottomLeft: Radius.circular(ww(context, 24)),
                ),
              ),
            )),
      ),
    );
