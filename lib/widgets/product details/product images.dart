import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grenta_store/widgets/network%20image%20widget.dart';

class ProductImagesSlider extends StatelessWidget {
  final List imagesURLList;

  const ProductImagesSlider({required this.imagesURLList});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imagesURLList
          .map((imageURL) => Builder(builder: (context) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: MyNetworkImage(imageUrl: imageURL, fit: BoxFit.fill),
                  // FadeInImage.assetNetwork(
                  //   imageErrorBuilder: (_, error, stacktrace) =>
                  //       Image.asset("images/logo.gif"),
                  //   placeholder: "images/loading.gif",
                  //   image: imageURL,
                  //   fit: BoxFit.fill,
                  // ),
                );
              }))
          .toList(),
      options: CarouselOptions(
        height: 300.0,
        autoPlay: true,
        initialPage: 0,
        enlargeCenterPage: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
