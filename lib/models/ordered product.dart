import 'package:grenta_store/models/product%20details.dart';
import 'package:grenta_store/models/product.dart';

class OrderedProduct {
   ProductDetails ?productDetails;
   int? orderNumber;
  String selectedSize;
   Product ?product;
  int _count = 0;
  OrderedProduct({
    this.orderNumber,
     this.productDetails,
     this.product,
    int ?  count,
    required this.selectedSize,

  }){
    if(count!=null){
      _count=count;
    }
    productDetails!=null?product=productDetails!.product:null;}
  bool increaseCount() {
    if (productDetails!.sizesMap[selectedSize]! > 0) {
      _count++;
      productDetails!.sizesMap[selectedSize] =
          productDetails!.sizesMap[selectedSize]! - 1;

      return true;
    } else {
      return false;
    }
  }

  bool decreaseCount() {
    if (_count > 1) {
      _count--;
      productDetails!.sizesMap[selectedSize] =
          productDetails!.sizesMap[selectedSize]! + 1;
      return true;
    } else {
      return false;
    }
  }

  void resetCount() {
    productDetails!.sizesMap[selectedSize] =
        productDetails!.sizesMap[selectedSize]! + _count;
    _count = 0;
  }

  int getCount() => _count;
}
