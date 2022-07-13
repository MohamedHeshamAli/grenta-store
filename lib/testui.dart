import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/internet%20controller.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';
import 'package:grenta_store/widgets/order/delivery%20tracking%20time%20line.dart';

import 'common.dart';
import 'models/order.dart';


class TestUI extends StatelessWidget {
  InternetController _internetController=Get.put(InternetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("تفاصيل الطلب")),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DeliveryTracking(deliveryTrackingEnum: DeliveryEnum.ready),
          Expanded(
            child: ListView.builder(itemBuilder: (ctx,n)=>
                Container(
              height: 150,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: appBarColor, width: 1),
                  borderRadius: BorderRadiusDirectional.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyNetworkImage(
                    imageWidth: 100,
                    imageUrl: "url",
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " تيشيرت ",
                          overflow: TextOverflow.ellipsis,
                          style: textNameStyle,
                        ),
                        Text(
                          " مقاس : ${"s"}",
                          style: textNameStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          " العدد  : ${"1"}",
                          style: textNameStyle.copyWith(fontSize: 16),
                        ),

                        Text(
                          "${(25.3).toStringAsFixed(2)} جنيه ",
                          style: textPriceStyle,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            itemCount: 20,),
          ),

          const Text("التفاصيل",style: textNameStyle),
          Container(
            height: 140,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: appBarColor, width: 1),
                borderRadius: BorderRadiusDirectional.circular(10)),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const [
                    const Text(
                      "تاريخ الطلب",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "رقم الطلب",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "المستلم",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "الاجمالي",
                      style: TextStyle(color: Colors.grey),
                    ),

                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "25/5/2020",
                      style: textNameStyle,
                    ),
                    Text(
                      "568",
                      style: textNameStyle,
                    ),
                    Text(
                      "محمد هشام",
                      style: textNameStyle,
                    ),
                    Text(
                      "${50.6} جنيه",
                      style: textNameStyle,
                    )
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
