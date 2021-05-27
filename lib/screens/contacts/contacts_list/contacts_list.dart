import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../contacts_appbar/contacts_appbar.dart';
import 'empty_contact_layout.dart';
import 'not_empty_contact_layout.dart';

class ContactsList extends StatelessWidget {
  final Box<UserModel> contacts;

  const ContactsList({Key? key, required this.contacts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: s.width,
          height: s.height,
          padding: EdgeInsets.only(top: hh(context, 112)),
          child: contacts.values.isEmpty
              ? EmptyContactLayout()
              : NotEmptyContactLayout(contacts: contacts),
        ),
        ContactsAppbar(),
      ],
    );
  }
}
