import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/home%20controller.dart';
import 'package:grenta_store/widgets/home%20widgets/category%20card.dart';

class CategoryList extends StatelessWidget {
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: ListView.builder(
        itemCount: _controller.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, n) {
          return CategoryCard(
            category: _controller.categoryList.value[n],
            isSellected: _controller.selectedCategory.value.id ==
                _controller.categoryList.value[n].id,
          );
        },
      ),
    );
  }
}
