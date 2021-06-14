import 'package:flutter/material.dart';

import 'package:my_first_app/env/hiveinit.dart';
import 'package:my_first_app/screens/home_page.dart';
import 'package:my_first_app/screens/profile_page.dart';

import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  hiveInit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {ProfileScreen.routeName: (ctx) => ProfileScreen()},
      home: Homepage(),
    );
  }
}
