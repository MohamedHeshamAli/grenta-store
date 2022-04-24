import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/controllers/car%20controller.dart';
import 'package:grenta_store/models/product%20details.dart';
import 'package:grenta_store/models/product.dart';
import 'package:grenta_store/widgets/CircularIndicator.dart';
import 'package:grenta_store/widgets/carbutton.dart';
import 'package:grenta_store/widgets/product%20details/product%20images.dart';
import 'package:grenta_store/widgets/product%20details/size%20card.dart';

class ProductDetailsScreen extends StatelessWidget {
  final CarController _controller = Get.find<CarController>();

  @override
  Widget build(BuildContext context) {
    return GetX<CarController>(initState: (_) {
      _controller
          .setSelectedSize(_controller.currentProductDetails.sizesList[0]);
    }, builder: (_) {
      return _controller.loading.value
          ? const CircularIndicator()
          : Scaffold(
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
              bottomSheet: GestureDetector(
                onTap: () {
                  _controller.addProduct();
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  color: appBarColor,
                  child: const Center(
                    child: Text(
                      "اضافة الي عربة التسوق",
                      textAlign: TextAlign.center,
                      style: textTitleStyle,
                    ),
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
                          size: _controller.currentProductDetails.sizesList[n],
                        );
                      },
                      separatorBuilder: (ctx, n) => const SizedBox(
                        width: 5,
                      ),
                      itemCount:
                          _controller.currentProductDetails.sizesList.length,
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
                        _controller
                                .currentProductDetails.product.priceAfterRebate
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
    });
  }
}
