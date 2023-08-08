import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/routes/pages.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.INITIAL,
      //referring to the list of all the routes in 'routes'
      getPages: AppPages.routes,
    );
  }
}
