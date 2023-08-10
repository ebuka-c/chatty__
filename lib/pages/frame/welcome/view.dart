import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/values/appcolors.dart';
import 'controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//bind the view with the controller using getview, mentioning the type of controller
class WelcomePage extends GetView<WelcomeController> {
  Widget _buildPageHeadTitle(String title) {
    return Container(
      margin: EdgeInsets.only(top: 360),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryElementText,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 45.sp),
      ),
    );
  }

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width.round();
    // var h = MediaQuery.of(context).size.height.round();
    return Scaffold(
      backgroundColor: AppColors.primaryElement,
      body: Center(
        child: Container(
            width: 360.w,
            height: 780.h,
            child: _buildPageHeadTitle(controller.title)),
      ),
      //controller variable used to access all the variables and methods present in the controller
    );
  }
}
