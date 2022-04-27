import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/controllers/car%20controller.dart';
import 'package:grenta_store/models/ordered%20product.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';

class CarOrderCard extends StatelessWidget {
  final OrderedProduct orderedProduct;
  CarController _controller = Get.find<CarController>();
  CarOrderCard({required this.orderedProduct}) {
    _controller.setCurrentOrderedProduct(orderedProduct);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CarController>(builder: (_) {
      return GestureDetector(
        child: Container(
          height: 160,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: primaryCollor, width: 1),
              borderRadius: BorderRadiusDirectional.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyNetworkImage(
                imageWidth: 120,
                imageUrl: orderedProduct.product.mainImageURL,
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
                          orderedProduct.product.name,
                          overflow: TextOverflow.ellipsis,
                          style: textNameStyle,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline,
                            // color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      orderedProduct.selectedSize,
                      style: textNameStyle.copyWith(fontSize: 16),
                    ),
                    orderedProduct.product.rebate != 0
                        ? Text(
                            orderedProduct.product.price.toString(),
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
                            orderedProduct.product.priceAfterRebate.toString(),
                            style: textPriceStyle,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: primaryCollor, width: 1),
                              borderRadius:
                                  BorderRadiusDirectional.circular(10)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _controller.setCurrentOrderedProduct(
                                        orderedProduct);
                                    _controller.addProduct();
                                  },
                                  icon: const Icon(Icons.add)),
                              Container(
                                width: 30,
                                height: 40,
                                color: appBarColor,
                                child: FittedBox(
                                  child: Text(
                                    _controller.currentOrderedProduct.value
                                        .getCount()
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _controller.setCurrentOrderedProduct(
                                        orderedProduct);
                                    _controller.decrementProduct();
                                  },
                                  icon: const Icon(Icons.remove)),
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
    });
  }
}
