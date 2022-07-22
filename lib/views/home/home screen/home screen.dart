
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/controllers/home%20controller.dart';
import 'package:grenta_store/controllers/internet%20controller.dart';
import 'package:grenta_store/models/customer.dart';
import 'package:grenta_store/views/home/order%20history/orders%20history%20screen.dart';
import 'package:grenta_store/views/home/profile/profile screen.dart';
import 'package:grenta_store/views/login/login%20screen.dart';
import 'package:grenta_store/widgets/home%20widgets/appbar%20search%20widget.dart';
import 'package:grenta_store/views/home/home%20screen/minuScreen.dart';
import '../products/brows products  screen.dart';
class HomeScreen extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());
  final InternetController _internetController = Get.put(InternetController());
  ZoomDrawerController drawerController=ZoomDrawerController();

  @override
  Widget build(BuildContext context) {

      return  Scaffold(
          // bottomNavigationBar:  GetX<HomeController>(builder: (_) {
          //   return BottomNavigationBar(
          //     selectedItemColor: primaryCollor,
          //     unselectedItemColor: Colors.grey,
          //     type: BottomNavigationBarType.shifting,
          //     currentIndex: _controller.selectedNaveBar.value,
          //     onTap: (i) {
          //       if(_controller.selectedNaveBar.value!=i){
          //         _controller.changingNavBar(i);
          //       }
          //     },
          //     items: const [
          //       BottomNavigationBarItem(
          //           backgroundColor: appBarColor,
          //           label: "طلباتي",
          //           icon:
          //             FaIcon(FontAwesomeIcons.box),
          //           ),
          //       BottomNavigationBarItem(
          //           backgroundColor: appBarColor,
          //           label: "تسوق",
          //           icon: Icon(
          //             Icons.home,
          //           )),
          //       // BottomNavigationBarItem(
          //       //     backgroundColor: appBarColor,
          //       //     label: "حسابي",
          //       //     icon: Icon(
          //       //       Icons.manage_accounts,
          //       //     ))
          //     ],
          //   );
          // },
          // ),
          body:ZoomDrawer(style: DrawerStyle.defaultStyle,
            mainScreen:BrowsProductsScreen(),
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
          // GetX<HomeController>(builder: (_) {
          //   if(_controller.selectedScreen.value==NavigationScreensEnum.products) {
          //     return BrowsProductsScreen();
          //   }
          //   else if(_controller.selectedScreen.value==NavigationScreensEnum.profile){
          //     if(Customer.customer==null){
          //
          //      return LoginScreen(isHome: false,nextScreen: ProfileScreen());
          //     }
          //     else{
          //     return ProfileScreen();}
          //   }
          //   else{
          //
          //     return OrdersHistoryScreen();
          //   }
          // }),

      );
  }
}
