import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/controllers/car%20controller.dart';
import 'package:grenta_store/views/car/car%20screen.dart';

class CarBtn extends StatelessWidget {
  final CarController _controller = Get.put(CarController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(CarScreen());
      },
      child: GetX<CarController>(builder: (_) {
        return Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 35,
              color: Colors.white,
            ),
            _controller.carItemsCount.value != 0
                ? Container(
                    height: 12,
                    decoration: const BoxDecoration(
                      color: appBarColor,
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      child: Text(
                        _controller.carItemsCount.value.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ))
                : const SizedBox(),
          ],
        );
      }),
    );
  }
}
