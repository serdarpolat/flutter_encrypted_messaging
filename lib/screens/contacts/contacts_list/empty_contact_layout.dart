import 'package:chat_talkr/core/components/component_index.dart';
import 'package:flutter/material.dart';

class EmptyContactLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "You have no any contact",
        style: TextStyle(
          fontSize: hh(context, 16),
          fontWeight: FontWeight.w600,
          color: Clr.textLight,
        ),
      ),
    );
  }
}
