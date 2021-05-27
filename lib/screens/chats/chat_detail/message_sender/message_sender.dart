import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/services/data/chat_service.dart';
import 'package:chat_talkr/core/services/data/message_service_repo.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'sender_widgets.dart';

class MessageSender extends StatefulWidget {
  final UserSettings userSettings;
  final String receiverId;
  final String chatId;

  const MessageSender({
    Key? key,
    required this.userSettings,
    required this.receiverId,
    required this.chatId,
  }) : super(key: key);

  @override
  _MessageSenderState createState() => _MessageSenderState();
}

class _MessageSenderState extends State<MessageSender> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    TextEditingController msgCtrl = TextEditingController();
    MessageServiceRepo msgService = MessageServiceRepo();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: s.width,
        height: hh(context, 86),
        color: Clr.white,
        child: Padding(
          padding: EdgeInsets.only(left: ww(context, 16)),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: hh(context, 54),
                  padding: EdgeInsets.all(ww(context, 10)),
                  child: Row(
                    children: [
                      messageInput(
                        context,
                        msgCtrl: msgCtrl,
                      ),
                      addMedya(context),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ww(context, 8)),
                    border: Border.all(
                      color: Clr.textLight,
                      width: hh(context, 1),
                    ),
                  ),
                ),
              ),
              SizedBox(width: ww(context, 10)),
              sendButton(
                context,
                msgCtrl: msgCtrl,
                onTap: () async {
                  ChatService chatService = ChatService();

                  if (msgCtrl.text.isNotEmpty) {
                    await chatService
                        .getUser(widget.receiverId)
                        .then((user) async {
                      String message0 = msgService.encryptMessage(
                          msgCtrl.text, user.publicKey);
                      String message1 = msgService.encryptMessage(
                          msgCtrl.text, widget.userSettings.publicKey);

                      await FirebaseFirestore.instance
                          .collection('chats')
                          .doc(widget.chatId)
                          .collection('messages')
                          .add({
                        'message': [message0, message1],
                        'senderId': widget.userSettings.uuid,
                        'senttime': Timestamp.now(),
                        'status': 'unread',
                      });
                    });
                  }
                  // FocusScope.of(context).unfocus();
                  msgCtrl.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
