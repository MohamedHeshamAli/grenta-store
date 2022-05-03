import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
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
  final InternetController _internetController = Get.find<InternetController>();
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InternetController>(builder: (_) {
      return _internetController.internetCurrentStatus
          ? Builder(builder: (context) {
              return FadeInImage.assetNetwork(
                image: imageUrl,
                placeholder: "images/loading.gif",
                fit: fit,
                height: imageHeight,
                width: imageWidth,
                imageErrorBuilder: (ctx, ob, s) {
                  return Image.asset(
                    "images/logo.jpg",
                    height: imageHeight,
                    width: imageWidth,
                    fit: BoxFit.fill,
                  );
                },
              );
            })
          : FadeInImage.assetNetwork(
              image: imageUrl,
              placeholder: "images/loading.gif",
              fit: fit,
              height: imageHeight,
              width: imageWidth,
              imageErrorBuilder: (ctx, ob, s) {
                return Image.asset(
                  "images/NoInternet.png",
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.fill,
                );
              },
            );
      // CachedNetworkImage(
      //   placeholder: (ctx, s) => Image.asset("images/loading.gif"),
      //   errorWidget: (_, s, p) => FadeInImage.assetNetwork(
      //     placeholder: "images/loading.gif",
      //     image: imageUrl,
      //     imageErrorBuilder: (_, e, t) =>
      //     _internetController.internetCurrentStatus
      //         ? const Icon(Icons.error)
      //         : Image.asset(
      //       "images/NoInternet.png",
      //       height: imageHeight,
      //       width: imageWidth,
      //       fit: fit,
      //     ),
      //   ),
      //   imageUrl: imageUrl,
      //   height: imageHeight,
      //   width: imageWidth,
      //   fit: fit,
      // );
    });
  }

  Widget imageFade(String imageUrl, BoxFit fit) {
    return FadeInImage.assetNetwork(
      image: imageUrl,
      placeholder: "images/loading.gif",
      fit: fit,
      height: imageHeight,
      width: imageWidth,
      imageErrorBuilder: (ctx, ob, s) {
        return _internetController.internetCurrentStatus
            ? Image.asset(
                "images/logo.jpg",
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.fill,
              )
            : Image.asset(
                "images/NoInternet.png",
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.fill,
              );
      },
    );
  }
}
