import 'package:flutter/cupertino.dart';

class PhotoTile extends StatelessWidget {
  final String url;

  PhotoTile({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
      url,
      fit: BoxFit.cover,
    ));
  }
}
