import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:chat_talkr/models/user/user_model.dart';
import 'package:chat_talkr/screens/chats/chat_detail/chat_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResult extends StatelessWidget {
  final Iterable<UserModel> dataList;
  final UserSettings userSettings;

  const SearchResult(
      {Key? key, required this.dataList, required this.userSettings})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: dataList.map((user) {
        return Container(
          color: Clr.white,
          padding: EdgeInsets.symmetric(
              horizontal: ww(context, 16), vertical: ww(context, 8)),
          child: ListTile(
            onTap: () async {
              await FirebaseFirestore.instance.collection('chats').add({
                'fName': user.fName,
                'lName': user.lName,
                'userImg': user.photoUrl,
                'createdAt': Timestamp.now(),
                'members': [userSettings.uuid, user.uuid],
              }).then((value) {
                Routing.pushRep(
                  context,
                  ChatDetail(
                    chatId: value.id,
                    img: user.photoUrl,
                    receiverId: user.uuid,
                    userSettings: userSettings,
                  ),
                );
              });
            },
            contentPadding: EdgeInsets.all(0),
            title: Text(
              user.fName + " " + user.lName,
              style: TextStyle(
                color: Clr.text,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(hh(context, 40)),
              child: Container(
                width: hh(context, 40),
                height: hh(context, 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(hh(context, 40)),
                ),
                child: SvgPicture.asset(
                  "assets/images/user/${user.photoUrl}",
                  width: hh(context, 40),
                  height: hh(context, 40),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
