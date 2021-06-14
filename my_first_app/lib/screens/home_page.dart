import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_first_app/model/photos_model.dart';
import 'package:my_first_app/screens/profile_page.dart';
import 'package:my_first_app/screens/widget/top_bar.dart';
import 'package:my_first_app/env/keys.dart' as config;
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<Homepage> {
  List<PhotosModel> _photosData = [];

  Future<void> fetchphotos() async {
    final _dioInstance = Dio();

    _dioInstance.options.headers['Authorization'] =
        "Client-ID ${config.unsplashKey}";
    final _fetchData =
        await _dioInstance.get('https://api.unsplash.com/photos');
    for (var _items in _fetchData.data) {
      setState(() {
        _photosData.add(PhotosModel(
          id: _items['id'],
          imgURL: _items['urls']['regular'],
          name: '',
        ));
      });
      _photosData.add(PhotosModel(
        id: _items['id'],
        imgURL: _items['urls']['regular'],
        name: '',
      ));
    }
    print("object");
  }

  @override
  void initState() {
    fetchphotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: Hive.box('profile').listenable(),
                  builder: (BuildContext context, Box value, Widget? child) =>
                      TopBar(
                    title: value.get('name'),
                    subtitle: 'Developer',
                    color: Color(0xff0B3D2E),
                  ),
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
                  itemCount: _photosData.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (ctx, index) => Container(
                      child: Image.network(
                    _photosData[index].imgURL,
                    fit: BoxFit.cover,
                  )),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ProfileScreen.routeName);
          },
          child: Icon(Icons.edit),
        ));
  }
}
