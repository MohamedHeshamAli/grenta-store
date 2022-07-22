import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grenta_store/common/common.dart';
class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
      child: Drawer(
      child: DrawerHeader(
        child: Column(
          children: [
            Expanded(
              child: ListView(padding: const EdgeInsets.all(20),
                  children: [
                    const Icon(FontAwesomeIcons.solidUserCircle,color: appBarColor,size: 40,),
                ListTile(title: Text("المنتجات",style: textPriceStyle),leading: Icon(FontAwesomeIcons.box,color: appBarColor,),)
              ]),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
