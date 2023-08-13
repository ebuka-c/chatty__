import 'package:get/get.dart';

import 'controller.dart';

//first to get called, then controller and variables inside, then app ui will be reactive
//here we inject dependencies / controllers
class ProfileBinding implements Bindings {
  @override
  //dependency injection (through which the view will depend on the controller)
  //, binds the information and state from the controller to the memory so the app
  //can access them
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
