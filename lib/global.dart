import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/store/storage.dart';
import 'common/store/user.dart';

class Global {
  static Future init() async {
    //since it's async, app will wait until everything is loaded
    WidgetsFlutterBinding
        .ensureInitialized(); //making sure dependencies are loaded before widgets
    await Get.putAsync<StorageService>(
        () => StorageService().init()); //initialize storage service
    Get.put<UserStore>(UserStore());
  }
}
