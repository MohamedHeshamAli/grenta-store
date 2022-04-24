import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/widgets/CircularIndicator.dart';

import '../../controllers/home controller.dart';
import 'product card.dart';

class ProductsGrid extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: _controller.productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 2,
          ),
          itemBuilder: (ctx, n) {
            return ProductCard(product: _controller.productList.value[0]);
          }),
    );
  }
}
