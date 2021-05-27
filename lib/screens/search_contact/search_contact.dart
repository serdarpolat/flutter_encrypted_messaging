import 'package:chat_talkr/core/components/component_index.dart';
import 'package:chat_talkr/core/locators.dart';
import 'package:chat_talkr/core/services/providers.dart';
import 'package:chat_talkr/models/setting/profile.dart';
import 'package:chat_talkr/models/user/user_model.dart';
import 'package:chat_talkr/models/user/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search_appbar.dart';
import 'search_result.dart';

class SearchContact extends StatefulWidget {
  final UserSettings userSettings;

  const SearchContact({Key? key, required this.userSettings}) : super(key: key);
  @override
  _SearchContactState createState() => _SearchContactState();
}

class _SearchContactState extends State<SearchContact> {
  var userModel = getIt<UserViewModel>();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: s.width,
        height: s.height,
        color: Clr.grayBg,
        child: Stack(
          children: [
            Consumer(
              builder: (
                BuildContext context,
                SearchQuery query,
                Widget? child,
              ) {
                return Container(
                  width: s.width,
                  height: s.height,
                  padding: EdgeInsets.only(top: hh(context, 152)),
                  child: ChangeNotifierProvider(
                    create: (BuildContext context) => userModel,
                    child: StreamBuilder(
                      stream: userModel.usersByName(query.title),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<UserModel>> snapshot) {
                        if (snapshot.data == null) {
                          return Container();
                        }

                        var dataList = snapshot.data!
                            .where((el) => el.uuid != widget.userSettings.uuid);

                        return SearchResult(
                          dataList: dataList,
                          userSettings: widget.userSettings,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            SearchContactAppbar(),
          ],
        ),
      ),
    );
  }
}
