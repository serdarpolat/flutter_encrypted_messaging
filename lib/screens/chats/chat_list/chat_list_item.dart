import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/services/data/chat_service.dart';
import 'package:chat_talkr/models/chats/chat_model.dart';
import 'package:chat_talkr/models/messages/message_model.dart';
import 'package:chat_talkr/models/messages/message_view_model.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:chat_talkr/screens/chats/chat_detail/chat_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ChatListItem extends StatefulWidget {
  final UserSettings userSettings;
  final ChatModel chat;

  const ChatListItem({Key? key, required this.chat, required this.userSettings})
      : super(key: key);

  @override
  _ChatListItemState createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    var messageModel = GetIt.instance<MessageViewModel>();
    return ChangeNotifierProvider(
      create: (BuildContext context) => messageModel,
      child: StreamBuilder(
          stream: messageModel.messages(widget.chat.id, true),
          builder: (BuildContext context,
              AsyncSnapshot<List<MessageModel>> snapshot) {
            if (snapshot.data == null) return Container();

            List<MessageModel> messages = snapshot.data!;

            String lastMsg = getMsg(messages.first, widget.userSettings);

            Timestamp senttime = messages.first.senttime;
            String date = getTime(senttime);

            int count = unreadCount(messages, widget.userSettings.uuid);

            return InkWell(
              onTap: () async {
                print(1);
                var receiverId = "";
                for (var id in widget.chat.members) {
                  if (id != widget.userSettings.uuid) receiverId = id;
                }

                Routing.push(
                  context,
                  ChatDetail(
                    receiverId: receiverId,
                    userSettings: widget.userSettings,
                    chatId: widget.chat.id,
                    img: widget.chat.userImg,
                  ),
                );
              },
              child: Container(
                width: s.width,
                height: hh(context, 72),
                decoration: BoxDecoration(
                  color: Clr.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Clr.grayBg,
                      width: 1,
                    ),
                  ),
                ),
                child: paddingHorizontal(
                  context,
                  child: Row(
                    children: [
                      userImage(context, widget.chat.userImg),
                      msgInfo(context,
                          msg: lastMsg,
                          name: widget.chat.fName + " " + widget.chat.lName),
                      sentTime(context, unreadCount: count, time: date),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

Widget sentTime(BuildContext context,
        {required String time, required int unreadCount}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          time,
          style: TextStyle(
            color: Clr.text,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: hh(context, 6),
        ),
        Container(
          width: ww(context, 20),
          height: ww(context, 20),
          child: Center(
            child: Text(
              unreadCount > 0 ? unreadCount.toString() : "",
              style: TextStyle(
                fontSize: 12,
                color: Clr.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: unreadCount > 0 ? Clr.green : Colors.transparent,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );

Widget msgInfo(BuildContext context,
        {required String msg, required String name}) =>
    Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ww(context, 12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Clr.text,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: hh(context, 4)),
            Text(
              msg.length > 35 ? msg.substring(0, 35) + "..." : msg,
              style: TextStyle(
                color: Clr.text,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );

Widget userImage(BuildContext context, String img) => ClipRRect(
      borderRadius: BorderRadius.circular(hh(context, 50)),
      child: Container(
        width: hh(context, 50),
        height: hh(context, 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(hh(context, 50)),
        ),
        child: SvgPicture.asset(
          "assets/images/user/$img",
          width: hh(context, 50),
          height: hh(context, 50),
        ),
      ),
    );
