import 'package:flutter/material.dart';
import 'package:my_first_app/screens/widget/top_bar.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
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
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
              itemBuilder: (ctx, index) => Container(
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1586601473758-846acb72d517?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=749&q=80',
                    fit: BoxFit.cover,
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
