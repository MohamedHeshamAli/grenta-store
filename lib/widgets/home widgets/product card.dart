import 'package:flutter/material.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/models/product.dart';
import 'package:get/get.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';
import 'package:grenta_store/views/product%20details/product%20details%20screen.dart';

import '../../controllers/car controller.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final CarController _controller = Get.find<CarController>();
        _controller.setCurrentProduct(product);
        _controller.getProductDetails();
        Get.to(ProductDetailsScreen());
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  height: 230,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: MyNetworkImage(imageUrl: product.mainImageURL),
                  ),
                ),
                product.rebate > 0
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).bottomAppBarColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5))),
                          width: 50,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            product.rebate.toString() + " %",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      product.name,
                      style: textNameStyle,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      product.priceAfterRebate.toString() + " جنيه",
                      style: textPriceStyle,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  product.rebate > 0
                      ? FittedBox(
                          child: Text(
                            product.price.toString() + " جنية",
                            style: textLineThroughStyle,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
