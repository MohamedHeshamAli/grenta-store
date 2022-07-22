import 'package:flutter/material.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/models/order.dart';
import 'package:grenta_store/models/ordered%20product.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';
class OrderedProductWidget  extends StatelessWidget {
   Function onTap;
  final OrderedProduct orderedProduct;
    OrderedProductWidget ({required this.onTap,
   required this.orderedProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
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
                  imageUrl: orderedProduct.product!.mainImageURL,
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
                        orderedProduct.product!.name,
                        overflow: TextOverflow.ellipsis,
                        style: textNameStyle,
                      ),
                      Text(
                        " مقاس : ${orderedProduct.selectedSize}",
                        style: textNameStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        " العدد  : ${orderedProduct.getCount()}",
                        style: textNameStyle.copyWith(fontSize: 16),
                      ),

                      Text(
                        "${(orderedProduct.getCount()*orderedProduct.product!.priceAfterRebate).toStringAsFixed(2)} جنيه ",
                        style: textPriceStyle,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
    );
  }
}
