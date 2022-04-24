import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grenta_store/models/category.dart';
import 'package:grenta_store/models/product%20details.dart';
import 'package:grenta_store/models/product.dart';
import 'package:grenta_store/widgets/home%20widgets/product%20card.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'common.dart';
import 'widgets/home widgets/category card.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'widgets/product details/product images.dart';
import 'widgets/product details/size card.dart';

class TestUI extends StatelessWidget {
  Product product = Product(
    id: "id",
    rebate: 30,
    name: "تيشيرت",
    price: 60,
    mainImageURL: "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_GR91_02_01.jpg",
  );
  ProductDetails productDetails = ProductDetails(
    product: Product(
      id: "id",
      rebate: 30,
      name: "تيشيرت",
      price: 60,
      mainImageURL:
          "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_GR91_02_01.jpg",
    ),
    detailsImagesURLList: [
      "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_GR91_01_01.jpg",
      "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_GR91_02_01.jpg",
      "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_BK27_02_01.jpg",
      "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_BK27_01_01.jpg"
    ],
    productDescription:
        "تي شيرت اسود رياضي بقصّة ضيقة ورقبة مستديرة وطبعات قماشية فنية",
    quantity: 10,
    sizesList: ["S", "L", "XL", "XXL", "XXXL"],
  );
  Category category = Category(
      id: "id",
      imageURL: "https://dfcdn.defacto.com.tr/7/M4793AZ_NS_BG694_01_01.jpg",
      name: "تيشيرت رجالي");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("تفاصيل المنتج", style: textTitleStyle),
        ),
        bottomSheet: Container(
          height: 40,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: const Center(
            child: Text(
              "اضافه الي عربة التسوق",
              style: textTitleStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ProductImagesSlider(
                  imagesURLList: productDetails.detailsImagesURLList,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      //toDo add to favorites
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                )
              ],
            ),
            Container(
              height: 70,
              padding: EdgeInsets.all(5),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, n) {
                  return SizeCard(
                    size: productDetails.sizesList[n],
                  );
                },
                separatorBuilder: (ctx, n) => const SizedBox(
                  width: 5,
                ),
                itemCount: productDetails.sizesList.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "  السعر :  ",
                  style: textTitleStyle.copyWith(
                      color: Theme.of(context).primaryColor),
                ),
                productDetails.product.rebate != 0
                    ? Text(
                        productDetails.product.price.toString() + " جنية   ",
                        style: textLineThroughStyle,
                      )
                    : Container(),
                Text(
                  productDetails.product.priceAfterRebate.toString() + " جنية",
                  style: textPriceStyle,
                )
              ],
            ),
            Text(
              "  التفاصيل",
              style: textTitleStyle.copyWith(
                  color: Theme.of(context).primaryColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  productDetails.productDescription,
                  style: textPriceStyle.copyWith(color: Colors.grey),
                  softWrap: true,
                ),
              ),
            )),
          ],
        ));
  }
}
