import 'package:flutter/material.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/models/order.dart';

class DeliveryTracking extends StatelessWidget {
  DeliveryEnum deliveryTrackingEnum;
  DeliveryTracking({ required this.deliveryTrackingEnum});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 5,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const  SizedBox(width: 15,),
            const CircleAvatar(backgroundColor: Colors.green,radius: 15,child: Icon(Icons.check,color: Colors.white,),),

            Expanded(child: Container(color: deliveryTrackingEnum!=DeliveryEnum.notShaped?Colors.green:Colors.grey,height: 2,),),
            CircleAvatar(backgroundColor: deliveryTrackingEnum!=DeliveryEnum.notShaped?Colors.green:Colors.grey,radius: 15,child: deliveryTrackingEnum!=DeliveryEnum.notShaped?const Icon(Icons.check,color: Colors.white,):const SizedBox(),),

            Expanded(child: Container(color: deliveryTrackingEnum==DeliveryEnum.received?Colors.green:Colors.grey,height: 2,)),
            CircleAvatar(backgroundColor: deliveryTrackingEnum==DeliveryEnum.received?Colors.green:Colors.grey,radius: 15,child: deliveryTrackingEnum==DeliveryEnum.received?const Icon(Icons.check,color: Colors.white,):const SizedBox(),),
            const  SizedBox(width: 15,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('لم يتم الشحن',style: textHints),
            ),
            Container(
              padding:const  EdgeInsets.all(8.0),
              child: const Text('جاهز للشحن',style: textHints),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('تم الاستلام',style: textHints),
            ),
          ],
        ),
      ],

    );}}