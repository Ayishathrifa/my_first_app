import 'dart:io';

import 'package:hive/hive.dart';
import 'dart:io';
import 'package:my_first_app/core/database/userDB.dart';
import 'package:path_provider/path_provider.dart';

Future<void> hiveInit() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  Hive.init(appDocPath);
  await UserDB.init();
}
