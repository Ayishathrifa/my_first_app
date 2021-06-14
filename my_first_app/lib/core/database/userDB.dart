import 'package:hive/hive.dart';

class UserDB {
  static String boxName = 'profile';

  static Future<void> init() async => await Hive.openBox('boxName');

  Future<void> saveData({required String name}) async {
    Box box = Hive.box(boxName);
    await box.put('name', 'name');
  }

  String retrivedata() {
    Box box = Hive.box(boxName);
    String name = box.get('name');
    return name;
  }
}
