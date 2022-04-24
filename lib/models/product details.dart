import 'package:grenta_store/models/product.dart';

class ProductDetails {
  final List<String> detailsImagesURLList;
  final String productDescription;
  final List<String> sizesList;
  final int quantity;
  final Product product;
  ProductDetails({
    required this.product,
    required this.detailsImagesURLList,
    required this.productDescription,
    required this.quantity,
    required this.sizesList,
  });
}
