import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/internet%20controller.dart';

class MyNetworkImage extends StatelessWidget {
  final String imageUrl;
  BoxFit fit;
  int downloading = 0;
  double imageHeight, imageWidth;

  MyNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.imageWidth = double.infinity,
    this.imageHeight = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InternetController _internetController =
        Get.find<InternetController>();
    return GetX<InternetController>(builder: (_) {
      if (_internetController.reBuild.value) {
        return CachedNetworkImage(
          errorWidget: (_, s, p) => FadeInImage.assetNetwork(
              placeholder: "images/loading.gif",
              image: imageUrl,
              imageErrorBuilder: (_, e, t) => const Icon(Icons.error)),
          imageUrl: imageUrl,
          height: imageHeight,
          width: imageWidth,
          fit: fit,
        );
      } else {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (_, s, d) {
            print("Error");

            return Image.asset(
              "images/NoInternet.png",
              height: imageHeight,
              width: imageWidth,
              fit: BoxFit.fitWidth,
            );
          },
          height: imageHeight,
          width: imageWidth,
          fit: fit,
        );
      }
    });
  }
}
