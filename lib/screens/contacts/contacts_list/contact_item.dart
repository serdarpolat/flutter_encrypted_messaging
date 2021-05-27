import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactItem extends StatelessWidget {
  final UserModel e;

  const ContactItem({Key? key, required this.e}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Clr.white,
      padding: EdgeInsets.symmetric(
          horizontal: ww(context, 16), vertical: ww(context, 8)),
      child: ListTile(
        onTap: () {
          print(e.fName);
        },
        contentPadding: EdgeInsets.all(0),
        title: Text(
          e.fName + " " + e.lName,
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
              "assets/images/user/${e.photoUrl}",
              width: hh(context, 40),
              height: hh(context, 40),
            ),
          ),
        ),
      ),
    );
  }
}
