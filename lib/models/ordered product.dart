import 'package:grenta_store/models/product.dart';

class OrderedProduct {
  Product product;
  String selectedSize;
  int _count = 0;
  OrderedProduct({
    required this.product,
    required this.selectedSize,
  });
  bool increaseCount() {
    if (product.quant > 0) {
      _count++;
      product.quant--;

      return true;
    } else {
      return false;
    }
  }

  bool decreaseCount() {
    if (_count > 1) {
      _count--;
      product.quant++;
      return true;
    } else {
      return false;
    }
  }

  void resetCount() {
    product.quant += _count;
    _count = 0;
  }

  int getCount() => _count;
}
