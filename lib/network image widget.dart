import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/internet%20controller.dart';

class MyNetworkImage extends StatelessWidget {
  MyNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String imageUrl;
  BoxFit fit;
  int downloading = 0;
  @override
  Widget build(BuildContext context) {
    final InternetController _internetController =
        Get.find<InternetController>();
    return GetX<InternetController>(builder: (_) {
      if (_internetController.reBuild.value) {
        return CachedNetworkImage(
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Image.asset("images/loading.gif");
          },
          errorWidget: (_, s, p) => FadeInImage.assetNetwork(
              placeholder: "images/loading.gif",
              image: imageUrl,
              imageErrorBuilder: (_, e, t) => Icon(Icons.error)),
          imageUrl: imageUrl,
          height: double.infinity,
          width: double.infinity,
          fit: fit,
        );
      } else {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (_, s, d) {
            print("Error");

            return Image.asset(
              "images/NoInternet.png",
              height: 230,
              width: 200,
              fit: BoxFit.fitWidth,
            );
          },
          height: double.infinity,
          width: double.infinity,
          fit: fit,
        );
      }
    });
  }
}
