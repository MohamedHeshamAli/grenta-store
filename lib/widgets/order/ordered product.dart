import 'package:flutter/material.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/models/order.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';
class OrderedProductWidget  extends StatelessWidget {
  final Function onTap;
  final Order order;
   OrderedProductWidget ({required this.onTap,
   required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Expanded(
        child: ListView.builder(
          itemCount: order.productsList.length,itemBuilder: (ctx,n)=>
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
                          order.productsList[n].product!.name,
                          overflow: TextOverflow.ellipsis,
                          style: textNameStyle,
                        ),
                        Text(
                          " مقاس : ${order.productsList[n].selectedSize}",
                          style: textNameStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          " العدد  : ${order.productsList[n].getCount()}",
                          style: textNameStyle.copyWith(fontSize: 16),
                        ),

                        Text(
                          "${(order.productsList[n].getCount()*order.productsList[n].product!.priceAfterRebate).toStringAsFixed(2)} جنيه ",
                          style: textPriceStyle,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
      ) ,
    );
  }
}
