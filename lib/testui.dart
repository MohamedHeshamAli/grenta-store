import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/internet%20controller.dart';
import 'package:grenta_store/views/home/home%20screen/home%20screen.dart';
import 'package:grenta_store/views/home/products/brows%20products%20%20screen.dart';
import 'package:grenta_store/views/home/home%20screen/minuScreen.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';
import 'package:grenta_store/widgets/order/delivery%20tracking%20time%20line.dart';

import 'common/common.dart';
import 'models/order.dart';


class TestUI extends StatelessWidget {

  InternetController _internetController=Get.put(InternetController());
  ZoomDrawerController drawerController=ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(style: DrawerStyle.defaultStyle,
        mainScreen:HomeScreen(),
        menuScreen:MenuWidget() ,
      controller: drawerController,
        menuBackgroundColor: primaryCollor,
        borderRadius: 24,
        showShadow: true,
        shadowLayer2Color: Colors.grey[400],
        isRtl:true ,
        angle: -0.00,
        slideWidth:MediaQuery.of(context).size.width*0.65 ,
        clipMainScreen: false,
        openCurve:Curves.fastLinearToSlowEaseIn ,
        closeCurve: Curves.bounceIn,
        drawerShadowsBackgroundColor: primaryCollor,
      ),
    );
  }
}
