import 'package:flutter/material.dart';
import 'package:grenta_store/repository/Repo.dart';

import 'models/customer.dart';

RemoteRepo remoteRepo = RemoteRepo();
Customer? currentCustomer;
double screenWidth = 1;
double screenHeight = 2;

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
const textHints=TextStyle(
  color: Colors.grey,fontSize: 12
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
