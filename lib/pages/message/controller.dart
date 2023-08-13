import 'package:chatty__/common/routes/names.dart';
import 'package:chatty__/pages/message/state.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  MessageController(); //initialize constructor
  final state = MessageState(); //initiialize state class

  Future<void> goProfile() async {
    await Get.toNamed(AppRoutes.Profile);
  }
}
