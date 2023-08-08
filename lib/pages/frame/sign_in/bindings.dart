import 'package:get/get.dart';

import 'controller.dart';

//here we inject dependencies / controllers
class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
