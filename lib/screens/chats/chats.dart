import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:chat_talkr/screens/contacts/contacts.dart';
import 'package:chat_talkr/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'chat_appbar.dart';
import 'chat_list/chat_list.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  // clear() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setBool(Vars.shrFirstlogin, false);
  // }

  late UserSettings userSettings;

  @override
  void initState() {
    // clear();
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
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
          valueListenable: Hive.box<UserSettings>('profile').listenable(),
          builder:
              (BuildContext context, Box<UserSettings> box, Widget? child) {
            if (box.values.isEmpty) {
              return Center(
                child: Text("No Data"),
              );
            }

            userSettings = box.values.last;
            Box<UserSettings> profileBox = Hive.box<UserSettings>('profile');
            print("KEY : " + profileBox.get('key').toString());

            return Stack(
              children: [
                ChatList(
                  userSettings: userSettings,
                ),
                ChatAppbar(
                  onTap: () {
                    Routing.push(
                        context, ProfilePage(userSettings: userSettings));
                  },
                  userSettings: userSettings,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routing.push(context, Contacts(userSettings: userSettings));
        },
        backgroundColor: Clr.blue,
        child: SvgPicture.asset(
          "assets/icons/MessageBubble.svg",
          width: ww(context, 24),
        ),
      ),
    );
  }
}
