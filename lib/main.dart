import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/testui.dart';
import 'package:grenta_store/views/home/home%20screen.dart';

import 'views/login/login screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale("ar"),
      theme: appTheme,
      home: //TestUI(),
          LoginScreen(),
      //HomeScreen(),
    );
  }
}
