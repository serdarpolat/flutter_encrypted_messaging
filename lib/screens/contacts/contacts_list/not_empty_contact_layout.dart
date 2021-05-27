import 'package:chat_talkr/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'contact_item.dart';

class NotEmptyContactLayout extends StatelessWidget {
  final Box<UserModel> contacts;

  const NotEmptyContactLayout({Key? key, required this.contacts})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: contacts.values.map((e) {
          return ContactItem(e: e);
        }).toList(),
      ),
    );
  }
}
