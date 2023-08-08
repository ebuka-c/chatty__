import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../welcome/controller.dart';

//bind the view with the controller using getview, mentioning the type of controller
class SignInPage extends GetView<WelcomeController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();

    Widget _buildLogo() {
      return Container(
        margin: EdgeInsets.only(top: h * 1),
        child: Text('Chatty .'),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(children: [_buildLogo()]),
      ),
    );
  }
}
