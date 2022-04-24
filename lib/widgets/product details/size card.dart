import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/controllers/car%20controller.dart';

class SizeCard extends StatelessWidget {
  final CarController _controller = Get.find<CarController>();

  final String size;
  SizeCard({required this.size});
  @override
  Widget build(BuildContext context) {
    return GetX<CarController>(builder: (_) {
      return GestureDetector(
        onTap: () {
          _controller.setSelectedSize(size);
        },
        child: CircleAvatar(
          backgroundColor: _controller.selectedSize.value == size
              ? Theme.of(context).primaryColor
              : Colors.grey,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  size,
                  softWrap: true,
                  style: textTitleStyle,
                )),
          ),
        ),
      );
    });
  }
}
