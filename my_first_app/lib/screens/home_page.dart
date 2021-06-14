import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:my_first_app/screens/profile_page.dart';
import 'package:my_first_app/screens/widget/photo_grid.dart';
import 'package:my_first_app/screens/widget/top_bar.dart';

import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _profileEdit() {
    Navigator.of(context)
        .pushNamed(ProfileScreen.routeName, arguments: "RIFA")
        .then((value) => print("object $value"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileTab(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'DEVELOPER',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                PhotoGrid()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _profileEdit,
          child: Icon(Icons.edit),
        ));
  }

  ValueListenableBuilder<Box<dynamic>> profileTab() {
    return ValueListenableBuilder(
      valueListenable: Hive.box('profile').listenable(),
      builder: (BuildContext context, Box value, Widget? child) => TopBar(
        title: value.get('name'),
        subtitle: 'Developer',
        color: Color(0xff0B3D2E),
      ),
    );
  }
}
