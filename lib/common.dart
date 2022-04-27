import 'package:flutter/material.dart';
import 'package:grenta_store/repository/Repo.dart';

RemoteRepo remoteRepo = RemoteRepo();
//applicationId "com.example.grenta_store" in android-app-build.gridle in defaultConfig
//apply plugin: 'ccom.android.library'
// فوق
//apply plugin
// --main-color: #25aae2;
// --second-color: #15161d;
// --second-light-color: #1e1f29;
// --gray-color: #e7e5f1
const appBarColor = Color(0xff2781aa);
const primaryCollor = Color(0xff003147);
const backgroundColor = Colors.white;
final appTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  bottomAppBarColor: appBarColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: textTitleStyle,
    color: appBarColor,
  ),
  primaryColor: primaryCollor,
);
const textLineThroughStyle = TextStyle(
  decoration: TextDecoration.lineThrough,
  fontSize: 12,
  color: Colors.grey,
);
const textPriceStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: appBarColor,
);
const textTitleStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const textNameStyle =
    TextStyle(fontSize: 20, color: primaryCollor, fontWeight: FontWeight.bold);
