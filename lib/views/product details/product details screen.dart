import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/controllers/car%20controller.dart';
import 'package:grenta_store/widgets/CircularIndicator.dart';
import 'package:grenta_store/widgets/car/carbutton.dart';
import 'package:grenta_store/widgets/product%20details/product%20images.dart';
import 'package:grenta_store/widgets/product%20details/size%20card.dart';

class ProductDetailsScreen extends StatelessWidget {
  final CarController _controller = Get.find<CarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(child: CarBtn()),
          const SizedBox(
            width: 15,
          ),
        ],
        centerTitle: true,
        title: const Text("تفاصيل المنتج", style: textTitleStyle),
      ),
      body: GetX<CarController>(builder: (_) {
        return _controller.loading.value
            ? const CircularIndicator()
            : Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      _controller.addProduct(context);
                    },
                    backgroundColor: appBarColor,
                    label: const Text(
                      "اضافة الي عربة التسوق",
                      textAlign: TextAlign.center,
                      style: textTitleStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ProductImagesSlider(
                          imagesURLList: _controller
                              .currentProductDetails.detailsImagesURLList,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              //toDo add to favorites
                            },
                            icon: Icon(Icons.favorite_border),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.all(5),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, n) {
                          return SizeCard(
                            size: _controller
                                .currentProductDetails.sizesMap.keys
                                .toList()[n],
                          );
                        },
                        separatorBuilder: (ctx, n) => const SizedBox(
                          width: 5,
                        ),
                        itemCount: _controller
                            .currentProductDetails.sizesMap.keys
                            .toList()
                            .length,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "  السعر :  ",
                          style: textTitleStyle.copyWith(
                              color: Theme.of(context).primaryColor),
                        ),
                        _controller.currentProductDetails.product.rebate != 0
                            ? Text(
                                _controller.currentProductDetails.product.price
                                        .toString() +
                                    " جنية   ",
                                style: textLineThroughStyle,
                              )
                            : Container(),
                        Text(
                          _controller.currentProductDetails.product
                                  .priceAfterRebate
                                  .toString() +
                              " جنية",
                          style: textPriceStyle,
                        )
                      ],
                    ),
                    Text(
                      "  التفاصيل",
                      style: textTitleStyle.copyWith(
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          _controller.currentProductDetails.productDescription,
                          style: textPriceStyle.copyWith(color: Colors.grey),
                          softWrap: true,
                        ),
                      ),
                    )),
                  ],
                ));
      }),
    );
  }
}
