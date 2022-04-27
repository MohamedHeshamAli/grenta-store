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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "عربة التسوق",
        ),
      ),
      body: GetX<CarController>(
        builder: (_) {
          return ListView.builder(
            itemCount: _controller.carItemsList.length,
            itemBuilder: (ctx, n) {
              return Text("_controller.orderedProductList");
            },
          );
        },
      ),
    );
  }
}
