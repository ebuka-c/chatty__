import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../frame/welcome/controller.dart';

//bind the view with the controller using getview, mentioning the type of controller
class MessagePage extends GetView<WelcomeController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width.round();
    // var h = MediaQuery.of(context).size.height.round();
    return Scaffold();
  }
}
