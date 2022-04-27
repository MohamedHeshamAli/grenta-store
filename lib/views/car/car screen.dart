import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/controllers/car%20controller.dart';
import 'package:grenta_store/widgets/car%20order%20card.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';

class CarScreen extends StatelessWidget {
  CarScreen({Key? key}) : super(key: key);
  CarController _controller = Get.put(CarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarController>(
      builder: (_) {
        return Scaffold(
          bottomSheet: Card(
            color: appBarColor,
            child: Text(_controller.carItemsCount.value.toString()),
          ),
          appBar: AppBar(
            title: const Text(
              "عربة التسوق",
            ),
          ),
          body: ListView.builder(
            itemCount: _controller.carItemsList.length,
            itemBuilder: (ctx, n) {
              return CarOrderCard(orderedProduct: _controller.carItemsList[n]);
            },
          ),
        );
      },
    );
  }
}
