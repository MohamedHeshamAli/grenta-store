import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/controllers/car%20controller.dart';
import 'package:grenta_store/models/ordered%20product.dart';
import 'package:grenta_store/widgets/alert/alert%20with%20button.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';
import 'package:grenta_store/views/product%20details/product%20details%20screen.dart';

class CarOrderCard extends StatelessWidget {
  final OrderedProduct orderedProduct;
  final CarController _controller = Get.find<CarController>();
  CarOrderCard({required this.orderedProduct});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.setCurrentProductDetails(orderedProduct.productDetails);
        _controller.setSelectedSize(orderedProduct.selectedSize);
        Get.to(ProductDetailsScreen());
        // Get.to(ProductDetailsScreen());
      },
      child: Container(
        height: 160,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: appBarColor, width: 1),
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyNetworkImage(
              imageWidth: 120,
              imageUrl: orderedProduct.productDetails!.product.mainImageURL,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderedProduct.productDetails!.product.name,
                        overflow: TextOverflow.ellipsis,
                        style: textNameStyle,
                      ),
                      IconButton(
                        onPressed: () {
                          AlertWithBtn(
                              context: context,
                              btnTxt: "نعم",
                              message: "هل تريد حذف المنتج",
                              onPressed: () {
                                _controller.removeOrderedProduct(
                                    orderedProduct: orderedProduct);
                              });
                        },
                        icon: const Icon(Icons.delete_outline, color: Colors.red
                            // color: Colors.red,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    " مقاس : ${orderedProduct.selectedSize}",
                    style: textNameStyle.copyWith(fontSize: 16),
                  ),
                  orderedProduct.productDetails!.product.rebate != 0
                      ? Text(
                          (orderedProduct.productDetails!.product.price *
                                  orderedProduct.getCount())
                              .toStringAsFixed(2),
                          style: textLineThroughStyle,
                        )
                      : const SizedBox(),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          (orderedProduct
                                      .productDetails!.product.priceAfterRebate *
                                  orderedProduct.getCount())
                              .toStringAsFixed(2),
                          style: textPriceStyle,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: appBarColor, width: 1),
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  _controller.incrementProduct(
                                      context: context,
                                      orderedProduct: orderedProduct);
                                },
                                icon: const Icon(Icons.add)),
                            Container(
                              width: 30,
                              height: 40,
                              color: appBarColor,
                              child: FittedBox(
                                child: Text(
                                  orderedProduct.getCount().toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  _controller.decrementProduct(
                                      orderedProduct: orderedProduct);
                                },
                                icon: const Icon(
                                  Icons.remove,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
