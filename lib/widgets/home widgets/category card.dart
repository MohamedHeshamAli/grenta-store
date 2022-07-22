import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/controllers/home%20controller.dart';
import 'package:grenta_store/models/category.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final bool isSellected;
  late final color;
  final _controller = Get.find<HomeController>();
  CategoryCard({
    required this.category,
    required this.isSellected,
  });
  @override
  Widget build(BuildContext context) {
    color = isSellected ? appBarColor : Colors.grey;
    return GestureDetector(
      onTap: () {
        _controller.changeCategory(category);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
                child: MyNetworkImage(
                  imageUrl: category.imageURL,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 3),
              ),
            ),
            SizedBox(
                width: 100,
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textPriceStyle.copyWith(color: color),
                ))
          ],
        ),
      ),
    );
  }
}
