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
    return GetBuilder<InternetController>(builder: (_) {
      return CachedNetworkImage(
        placeholder: (ctx, s) => Image.asset("images/loading.gif"),
        errorWidget: (_, s, p) => FadeInImage.assetNetwork(
          placeholder: "images/loading.gif",
          image: imageUrl,
          imageErrorBuilder: (_, e, t) =>
              _internetController.internetCurrentStatus
                  ? const Icon(Icons.error)
                  : Image.asset(
                      "images/NoInternet.png",
                      height: imageHeight,
                      width: imageWidth,
                      fit: fit,
                    ),
        ),
        imageUrl: imageUrl,
        height: imageHeight,
        width: imageWidth,
        fit: fit,
      );
    });
  }
}
