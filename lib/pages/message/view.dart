import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/values/appcolors.dart';
import 'controller.dart';

//bind the view with the controller using getview, mentioning the type of controller
class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

//slivers are built lazily, can be used inside of custom scroll view

  Widget _headBar() {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.w,
        margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  child: Container(
                    width: 44.h,
                    height: 44.h,
                    decoration: BoxDecoration(
                        color: AppColors.primarySecondaryBackground,
                        borderRadius: BorderRadius.all(Radius.circular(22.h)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    //a controller object to help us to access the properities from state
                    child: controller.state.head_detail.value.avatar == null
                        ? Image(
                            image:
                                AssetImage('assets/images/account_header.png'),
                          )
                        : Text('hi'),
                  ),
                  onTap: () {
                    controller.goProfile();
                  },
                ),
                Positioned(
                  bottom: 0.w,
                  right: 0.w,
                  height: 14.w,
                  child: Container(
                    width: 14.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.w, color: AppColors.primaryElementText),
                        color: AppColors.primaryElementStatus,
                        borderRadius: BorderRadius.all(Radius.circular(12.w))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width.round();
    // var h = MediaQuery.of(context).size.height.round();
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: _headBar(),
              )
            ],
          )
        ],
      ),
    )
        // Center(child: Text('welcome to message page')),
        );
  }
}
