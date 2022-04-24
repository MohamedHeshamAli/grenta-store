import 'package:grenta_store/models/product.dart';

class OrderedProduct {
  Product product;
  String selectedSize;
  int _count = 0;
  OrderedProduct({
    required this.product,
    required this.selectedSize,
  });
  void increaseCount() {
    _count++;
  }

  int getCount() => _count;
}
