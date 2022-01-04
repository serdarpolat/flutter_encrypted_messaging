import 'package:chat_talkr/core/locators.dart';
import 'package:chat_talkr/core/services/providers.dart';
import 'package:chat_talkr/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/setting/profile.dart';
import 'models/user/user_model.dart';

Future<void> main() async {
  setUpLocators();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.registerAdapter(UserSettingsAdapter());
  Hive.registerAdapter(UserModelAdapter());

  await Hive.openBox<UserSettings>('profile');
  await Hive.openBox<UserModel>('contacts');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingState>(create: (_) => LoadingState()),
        ChangeNotifierProvider<IsLoginPage>(create: (_) => IsLoginPage()),
        ChangeNotifierProvider<SearchQuery>(create: (_) => SearchQuery()),
        ChangeNotifierProvider<LastMessage>(create: (_) => LastMessage()),
        ChangeNotifierProvider<AvatarScreenOpen>(
            create: (_) => AvatarScreenOpen()),
        ChangeNotifierProvider<UserPhotoState>(create: (_) => UserPhotoState()),
        ChangeNotifierProvider<ProfileAlertState>(
            create: (_) => ProfileAlertState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Gilroy',
        ),
        home: Splash(),
      ),
    );
  }
}
