import 'package:chatty__/pages/frame/welcome/state.dart';
import 'package:get/get.dart';

import '../../../common/routes/names.dart';

//the controller (sits b/w the ui and states; gets the state variables and
//shows it to the ui which talks to the controller and updates the state variables)
class WelcomeController extends GetxController {
  //initialize constructor
  WelcomeController();
  //initialize non changeable variables
  final title = 'Chatty .';
  //initiialize state class, creating a variable out of it inorder to be
  //able to use it later
  final state = WelcomeState();

  //onReady function (from getx) will be used for navigation/routing
  //gets called immediately after the constructor is initialized
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
        const Duration(seconds: 2), () => Get.offAllNamed(AppRoutes.Message));
  }
}

//controllers sit b/w ui and states; they get the state variables
//and show it to the ui which then talks to the controller and updates the
//state variables