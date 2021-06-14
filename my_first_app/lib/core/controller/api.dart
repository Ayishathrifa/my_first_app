import 'package:my_first_app/model/photos_model.dart';
import 'package:dio/dio.dart';
import 'package:my_first_app/env/keys.dart' as config;

class PhotosAPI {
  Future<List<PhotosModel>> fetchPhotos() async {
    BaseOptions options = new BaseOptions(
      followRedirects: false,
      validateStatus: (status) => true,
    );
    try {
      final _dioinstance = Dio(options);

      _dioinstance.options.headers['Authorization'] =
          "Client-ID ${config.unsplashKey}";

      final _fetchData =
          await _dioinstance.get('https://api.unsplash.com/photos');
      final List<PhotosModel> _photosData = [];

      for (var _items in _fetchData.data) {
        _photosData.add(PhotosModel(
          id: _items['id'],
          imgURL: _items['urls']['regular'],
          name: '',
        ));
        print("object");
      }
      return _photosData;
    } catch (e) {
      throw e;
    }
  }
}
