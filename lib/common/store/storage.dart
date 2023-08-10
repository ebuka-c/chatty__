import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService
    extends GetxService /*want it to be in the memory all the time*/ {
  static StorageService get to =>
      Get.find(); //Get.find returns instance of StorageService
  late final SharedPreferences
      _prefs; //dedicated memory in the app, stores data in the app's memory

//init method which creates a SharedPreferences instance (_prefs), which
//keeps the reference of all the value/data stored in the app
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  //saving app data/values using _prefs
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setString(key, value as String);
  }

  //to retrieve data
  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  //remove values of certain keys from the memory
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
