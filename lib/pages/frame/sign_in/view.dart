import 'package:chatty__/common/values/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../welcome/controller.dart';

//bind the view with the controller using getview, mentioning the type of controller
class SignInPage extends GetView<WelcomeController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width.round();
    // var h = MediaQuery.of(context).size.height.round();

    Widget _buildLogo() {
      return Container(
        margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
        child: Text(
          'Chatty .',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 34.sp),
        ),
      );
    }

    Widget _buildThirdPartyLogin(String loginType, String logo) {
      return GestureDetector(
        child: Container(
          width: 205.w,
          height: 44.h,
          padding: EdgeInsets.all(10.h),
          margin: EdgeInsets.only(bottom: 15.h),
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ]),
          child: Row(
              mainAxisAlignment: logo == ''
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                logo == ''
                    ? Container()
                    : Container(
                        padding: EdgeInsets.only(left: 40.w, right: 30.w),
                        child: Image.asset('assets/icons/${logo}.png'),
                      ),
                Container(
                  child: Text(
                    'Sign in with ${loginType}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp),
                  ),
                )
              ]),
        ),
        onTap: () {},
      );
    }

    Widget _buildOrWidget() {
      return Container(
        margin: EdgeInsets.only(top: 20.h, bottom: 35.h),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                indent: 50,
                height: 2.h,
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            const Text('  or  '),
            Expanded(
              child: Divider(
                endIndent: 50,
                height: 2.h,
                color: AppColors.primarySecondaryElementText,
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildSignInWidget() {
      return GestureDetector(
        child: Text(
          'Sign in here',
          style: TextStyle(
              color: AppColors.primaryElement,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp),
        ),
        onTap: () {},
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(children: [
          _buildLogo(),
          _buildThirdPartyLogin("Google", "google"),
          _buildThirdPartyLogin("Facebook", "facebook"),
          _buildThirdPartyLogin("Apple", "apple"),
          _buildOrWidget(),
          _buildThirdPartyLogin("phone number", ""),
          SizedBox(height: 35.h),
          Column(
            children: [
              Text(
                'Already have an account',
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp),
              ),
              _buildSignInWidget()
            ],
          )
        ]),
      ),
    );
  }
}
