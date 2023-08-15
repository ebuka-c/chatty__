import 'package:chatty__/common/entities/entities.dart';
import 'package:chatty__/common/store/user.dart';
import 'package:chatty__/pages/frame/sign_in/state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../common/routes/names.dart';

class SignInController extends GetxController {
  SignInController(); //initialize constructor
  final state = SignInState(); //initiialize state class

  final GoogleSignIn _googleSignIn = GoogleSignIn /*constructor*/ (scopes: [
    //how you want to login
    'openid', //enables use of same google account and password for many different apps & websites
  ]);

  Future<void> handleSignIn(String type) async {
    //1.email, 2.google, 3.facebook, 4.apple, 5.phone
    try {
      if (type == 'phone number') {
        if (kDebugMode) {
          print('you are loggin in with phone number');
        }
      } else if (type == 'google') {
        var user = await _googleSignIn
            .signIn(); //async b/c we'd have to talk to and wait for the server
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? 'assets/icons/google.png';

          //create an object using user info (based on the different fields above)
          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.open_id = id;
          loginPanelListRequestEntity.type = 2;
          asyncPostAllData(/*loginPageListRequestEntity*/);
        }
      } else {
        if (kDebugMode) {
          print('login type not sure');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('error with login $e');
      }
    }
  }

  // asyncPostAllData(){
  // }
  //will load all async data (data from server)
  asyncPostAllData() async {
    print('let\'s get to message page');

    var response = await HttpUtil().get('/api/index');
    UserStore.to.setIsLogin == true;
    Get.offAllNamed(AppRoutes.Message);
  }
}
