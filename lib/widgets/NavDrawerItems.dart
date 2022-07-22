import 'package:flutter/material.dart';

import '../common/common.dart';
class NavDrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const NavDrawerItem({required this.title,
  required this.onTap,
  required this.icon,});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        onTap();
      },
      child: Row(
        children: [Text(title,style: const TextStyle(fontSize: 16,color: Colors.white),),
        const Spacer(),
        Icon(icon,color: Colors.white,)],
      ),
    );
  }
}
