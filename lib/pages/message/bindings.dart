import 'package:get/get.dart';

import 'controller.dart';

//here we inject dependencies / controllers
class MessageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
  }
}
