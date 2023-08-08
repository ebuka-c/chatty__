import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../routes/names.dart';
import '../store/user.dart';

//check if user has logged in, gets called before access to
//a controller
class RouteAuthMiddleware extends GetMiddleware {
  //priority smaller the better
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    //UserStore saves the user data,  whether the user has logged in or not
    if (UserStore.to.isLogin ||
        route == AppRoutes.SIGN_IN ||
        route == AppRoutes.INITIAL) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => Get.snackbar('Tips', 'Login expired, please login again!'));
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
