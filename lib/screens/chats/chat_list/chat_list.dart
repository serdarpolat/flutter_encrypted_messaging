import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/models/chats/chat_model.dart';
import 'package:chat_talkr/models/chats/chats_view_model.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'chat_list_item.dart';

class ChatList extends StatefulWidget {
  final UserSettings userSettings;

  const ChatList({Key? key, required this.userSettings}) : super(key: key);
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    var chatModel = GetIt.instance<ChatViewModel>();

    return ChangeNotifierProvider(
      create: (BuildContext context) => chatModel,
      child: StreamBuilder(
          stream: chatModel.chats(widget.userSettings.uuid),
          builder:
              (BuildContext context, AsyncSnapshot<List<ChatModel>> snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );

            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );

            if (snapshot.data == null)
              return Center(
                child: Text("Chat Yok!"),
              );

            var data = snapshot.data!;

            return Container(
              padding: EdgeInsets.only(top: hh(context, 112)),
              child: ListView(
                padding: EdgeInsets.all(0),
                children: data.map((chat) {
                  return ChatListItem(
                    userSettings: widget.userSettings,
                    chat: chat,
                  );
                }).toList(),
              ),
            );
          }),
    );
  }
}
