import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/locators.dart';
import 'package:chat_talkr/models/messages/message_model.dart';
import 'package:chat_talkr/models/messages/message_view_model.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:chat_talkr/screens/chats/chat_detail/detail_appbar.dart';
import 'package:chat_talkr/screens/chats/chat_detail/message_sender/message_sender.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'message_bubble.dart';

class ChatDetail extends StatelessWidget {
  final UserSettings userSettings;
  final String chatId;
  final String img;
  final String receiverId;

  const ChatDetail({
    Key? key,
    required this.chatId,
    required this.img,
    required this.receiverId,
    required this.userSettings,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    var messageModel = getIt<MessageViewModel>();
    setMessageAsRead(chatId, userSettings.uuid);

    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        child: Stack(
          children: [
            Container(
              width: s.width,
              height: s.height,
              color: Clr.grayBg,
              padding: EdgeInsets.only(
                  bottom: hh(context, 86), top: hh(context, 100)),
              child: ChangeNotifierProvider(
                create: (BuildContext context) => messageModel,
                child: StreamBuilder(
                    stream: messageModel.messages(chatId, true),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<MessageModel>> snapshot) {
                      if (snapshot.data == null) {
                        return Container();
                      }
                      var messages = snapshot.data!;

                      return chatMessages(s, messages, userSettings);
                    }),
              ),
            ),
            DetailAppbar(userImg: img),
            MessageSender(
              userSettings: userSettings,
              receiverId: receiverId,
              chatId: chatId,
            ),
          ],
        ),
      ),
    );
  }
}

Widget chatMessages(
        Size s, List<MessageModel> messages, UserSettings userSettings) =>
    ListView.builder(
      itemCount: messages.length,
      padding: EdgeInsets.all(0),
      reverse: true,
      itemBuilder: (BuildContext context, int idx) {
        MessageModel msg = messages[idx];

        bool isMine = msg.senderId == userSettings.uuid;

        String message = getMsg(msg, userSettings);

        return messageBubble(
          context,
          s,
          message: message,
          isMine: isMine,
        );
      },
    );
