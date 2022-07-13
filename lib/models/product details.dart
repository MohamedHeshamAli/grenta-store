import 'package:grenta_store/models/product.dart';

class ProductDetails {
  final  List<String> detailsImagesURLList;
  final String productDescription;
  final Map<String, int> sizesMap;
  final Product product;
  ProductDetails({
    required this.product,
    required this.detailsImagesURLList,
    required this.productDescription,
    required this.sizesMap,
  });
  factory ProductDetails.fromJson(
      Map<String, dynamic> productDetailsJson, Product product) {
    return ProductDetails(
        product: product,
        detailsImagesURLList: productDetailsJson[""],
        productDescription: productDetailsJson[""],
        sizesMap: productDetailsJson[""]);
  }
}
