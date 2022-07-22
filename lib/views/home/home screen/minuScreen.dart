import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/models/customer.dart';
import 'package:grenta_store/views/home/change%20password/change%20passwor%20screen.dart';
import 'package:grenta_store/views/home/order%20history/orders%20history%20screen.dart';
import 'package:grenta_store/views/home/profile/profile%20screen.dart';
import 'package:grenta_store/views/login/login%20screen.dart';
import 'package:grenta_store/widgets/NavDrawerItems.dart';
import 'package:url_launcher/url_launcher_string.dart';
class MenuWidget extends StatelessWidget {
  
   const MenuWidget() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: primaryCollor,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         DrawerHeader(child:  Column(
           mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(FontAwesomeIcons.solidUserCircle,color: Colors.white,size: 60,),
            Customer.customer==null?const SizedBox():Text(Customer.customer!.email,style: const TextStyle(fontSize: 16,color: Colors.white)),
          ],
        )),

        Expanded(child: ListView(
          children: [
            const Divider(thickness: 2,color: Colors.white24,),
            NavDrawerItem(title:"بيانات الحساب" ,icon: Icons.manage_accounts,onTap: (){
    if(Customer.customer==null){

         Get.to(  LoginScreen(isHome: false,nextScreen: ProfileScreen())) ;
        }
        else{
    Get.to( ProfileScreen());}
    ZoomDrawer.of(context)!.toggle();
            },),
            const Divider(thickness: 2,color: Colors.white24,),
            const SizedBox(height: 10,),
            NavDrawerItem(title:"تغيير كلمة المرور" ,icon: Icons.lock,onTap: (){
              if(Customer.customer==null){

                Get.to(LoginScreen(isHome: false,nextScreen: ChangePasswordScreen())) ;
              }
              else{
                Get.to( ChangePasswordScreen());}
              ZoomDrawer.of(context)!.toggle();
              },),
            const Divider(thickness: 2,color: Colors.white24,),
            NavDrawerItem(title:"طلباتي" ,icon: FontAwesomeIcons.box,onTap: (){
              if(Customer.customer==null){
                Get.to(  LoginScreen(isHome: false,nextScreen: OrdersHistoryScreen())) ;
              }
              else{
                Get.to(OrdersHistoryScreen());}
              ZoomDrawer.of(context)!.toggle();
            },),
            const Divider(thickness: 2,color: Colors.white24,),
          ],
        )),
        const Divider(thickness: 2,color: Colors.white24,),
        const SizedBox(width: 5,),TextButton(child: Text("تواصل معنا 01151394540",style: textTitleStyle,),onPressed: ()async{
          print("tel");
          await launchUrlString("tel:+20 1151394540");
        },),
        const SizedBox(height: 10,),
        Row(children: [
          const SizedBox(width: 5,),InkWell(onTap: ()async{
            await launchUrlString("https://web.facebook.com/mohamed.armouti.3");

          },child: Icon(FontAwesomeIcons.facebook,size: 40,color: Colors.white,)),
          const SizedBox(width: 5,),
          const SizedBox(width: 5,), Icon(FontAwesomeIcons.whatsapp,size: 40,color: Colors.white,),
          const SizedBox(width: 5,), Icon(FontAwesomeIcons.instagram,size: 40,color: Colors.white,),

        ],),
        const SizedBox(height: 10,),
        Row(children: const [
          Icon(FontAwesomeIcons.telegram,size: 40,color: Colors.white,),
          const SizedBox(width: 5,),Icon(FontAwesomeIcons.tiktok,size: 40,color: Colors.white),
        ],),
        const SizedBox(height: 10,),


      ],
    ),);
  }
}
