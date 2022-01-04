import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:chat_talkr/models/user/user_model.dart';
import 'package:chat_talkr/screens/contacts/contacts_list/contacts_list.dart';
import 'package:chat_talkr/screens/search_contact/search_contact.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Contacts extends StatefulWidget {
  final UserSettings userSettings;

  const Contacts({Key? key, required this.userSettings}) : super(key: key);
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        color: Clr.grayBg,
        child: ValueListenableBuilder(
          valueListenable: Hive.box<UserModel>('contacts').listenable(),
          builder: (
            BuildContext context,
            Box<UserModel> contacts,
            Widget? child,
          ) {
            return ContactsList(contacts: contacts);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routing.push(
              context, SearchContact(userSettings: widget.userSettings));
        },
        backgroundColor: Clr.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
