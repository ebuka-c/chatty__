//A config file
import 'dart:convert';

import 'package:chatty__/common/store/storage.dart';
import 'package:get/get.dart';

import '../entities/user.dart';
import '../routes/names.dart';
import '../values/storage.dart';

//one of the config files for the app (to be loaded at the begining; as
//soon as the app boots up) ; we inject it globally
class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String token = ''; //to remember every user as a unique user

  final _profile = UserItem().obs; //deals with user data

  //getters
  bool get isLogin => _isLogin.value;
  UserItem get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    //our initializations and checkings
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    // var (profileOffline.isNotEmpty) {
    //   _isLogin.value = true;
    //   _profile(UserItem.fromJson(jsonDecode(profileOffline)));
    // }
  }

  //saving token (call from ui and save)
  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  //get profile.
  Future<String> getProfile() async {
    if (token.isEmpty) return "";
    // var result = await UserAPI.profile();
    // _profile(result);
    // _isLogin.value = true;
    return StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  }

  // saving profile
  Future<void> saveProfile(UserItem profile) async {
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
    _profile(profile);
    setToken(profile.access_token!);
  }

  // called during logout
  Future<void> onLogout() async {
    // if (_isLogin.value) await UserAPI.logout();
    // await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    // await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    // _isLogin.value = false;
    // token = '';
    Get.offAllNamed(AppRoutes.SIGN_IN);
  }
}
