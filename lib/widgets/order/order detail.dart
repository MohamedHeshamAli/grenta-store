import 'package:flutter/material.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/models/order.dart';
class OrderDetailsWidget extends StatelessWidget {
  Order order;
  OrderDetailsWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                order.date,
                style: textNameStyle,
              ),
              Text(
                order.orderNmunber.toString(),
                style: textNameStyle,
              ),
              Text(
                order.recevierName,
                style: textNameStyle,
              ),
              Text(
                "${order.totalPayed} جنيه",
                style: textNameStyle,
              )
            ],
          ),

        ],
      ),
    );
  }
}
