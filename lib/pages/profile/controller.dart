import 'package:chatty__/pages/frame/welcome/state.dart';
import 'package:chatty__/pages/profile/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/names.dart';
import '../../common/store/user.dart';

//the controller (sits b/w the ui and states; gets the state variables and
//shows it to the ui which talks to the controller and updates the state variables)
class ProfileController extends GetxController {
  //initialize constructor
  ProfileController();
  //initialize non changeable variables
  final title = 'Chatty .';
  //initiialize state class, creating a variable out of it inorder to be
  //able to use it later
  final state = ProfileState();

  Future<void> goLogOut() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}

//controllers sit b/w ui and states; they get the state variables
//and show it to the ui which then talks to the controller and updates the
//state variables