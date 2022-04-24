import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/controllers/home%20controller.dart';
import 'package:grenta_store/models/category.dart';

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
    color = isSellected ? Theme.of(context).bottomAppBarColor : Colors.grey;
    return GestureDetector(
      onTap: () {
        _controller.changeCategory(category);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProfileAvatar(
              category.imageURL,
              borderColor: color,
              radius: 50,
              borderWidth: 3,
            ),
            Container(
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
