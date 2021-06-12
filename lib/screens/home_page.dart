import 'package:flutter/material.dart';
import 'package:my_first_app/screens/widget/top_bar.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(
            title: 'AYISHATH RIFA',
            subtitle: 'Developer',
            color: Color(0xff0B3D2E),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'PHOTOGRAPHY',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ],
      ),
    ));
  }
}
