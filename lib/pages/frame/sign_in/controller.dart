import 'package:chatty__/pages/frame/sign_in/state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController(); //initialize constructor
  final state = SignInState(); //initiialize state class

  final GoogleSignIn _googleSignIn = GoogleSignIn /*constructor*/ (scopes: [
    //how you want to login
    'openid', //enables use of same google account and password for many different apps & websites
  ]);

  Future<void> handleSignIn(String type) async {
    //1.google, 2.facebook, 3.apple, 4.phone
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
}
