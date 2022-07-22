import 'package:get/get.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/models/product%20details.dart';
import 'package:grenta_store/models/product.dart';
import 'package:grenta_store/widgets/alert/alert%20message.dart';

import '../models/ordered product.dart';

class CarController extends GetxController {
  late Product currentProduct;
  late ProductDetails currentProductDetails;
  RxBool loading = false.obs;
  List<OrderedProduct> carItemsList = [];
  RxString selectedSize = "".obs;
  RxInt carItemsCount = 0.obs;
  double totalPrice = 0.0;
  @override

  // Rx<OrderedProduct> currentOrderedProduct = OrderedProduct(
  //     product:
  //     Product(price: 0, quant: 3, id: "0", mainImageURL: "", name: ""),
  //     selectedSize: "")
  //     .obs;
  // void setCurrentOrderedProduct(OrderedProduct orderedProduct) {
  //   currentOrderedProduct.value = orderedProduct;
  //   currentOrderedProduct.value.product = currentProduct;
  // }

  void removeOrderedProduct({required OrderedProduct orderedProduct}) {
    totalPrice -= (orderedProduct.getCount() *
        orderedProduct.productDetails!.product.priceAfterRebate);
    carItemsCount.value -= orderedProduct.getCount();
    orderedProduct.resetCount();
    carItemsList.remove(orderedProduct);
    update();
    //toDo increase the quan of order quan
  }

  void addProduct(context) {
    for (OrderedProduct item in carItemsList) {
      if (item.productDetails!.product.id == currentProduct.id &&
          item.selectedSize == selectedSize.value) {
        bool isAdded = item.increaseCount();
        if (isAdded) {
          carItemsCount.value++;
          totalPrice += (currentProduct.priceAfterRebate);
          update();
        } else {
          alertMessage(context, "لايمكنك اضافة المزيد");
        }

        return;
      }
    }
    OrderedProduct newOrder = OrderedProduct(
        productDetails: currentProductDetails,
        selectedSize: selectedSize.value);
    bool isAdded = newOrder.increaseCount();
    if (isAdded) {
      totalPrice += newOrder.productDetails!.product.priceAfterRebate;
      carItemsList.add(newOrder);
      carItemsCount.value++;
      update();
    } else {
      alertMessage(context, "لايمكنك اضافة المزيد");
    }
  }

  void incrementProduct(
      {required OrderedProduct orderedProduct, required context}) {
    for (OrderedProduct item in carItemsList) {
      if (item.productDetails!.product.id ==
              orderedProduct.productDetails!.product.id &&
          item.selectedSize == orderedProduct.selectedSize) {
        bool isAdded = item.increaseCount();
        if (isAdded) {
          totalPrice += orderedProduct.productDetails!.product.priceAfterRebate;
          carItemsCount.value++;
          update();
        } else {
          alertMessage(context, "لايمكنك اضافة المزيد");
        }
        return;
      }
    }
    OrderedProduct newOrder = OrderedProduct(
        productDetails: currentProductDetails,
        selectedSize: selectedSize.value);
    bool isAdded = newOrder.increaseCount();
    if (isAdded) {
      totalPrice += newOrder.productDetails!.product.priceAfterRebate;
      carItemsList.add(newOrder);
      carItemsCount.value++;
      update();
    } else {
      alertMessage(context, "لايمكنك اضافة المزيد");
    }
    //toDo decrease the quan of order quan
  }

  void decrementProduct({required OrderedProduct orderedProduct}) {
    for (OrderedProduct item in carItemsList) {
      if (item.productDetails!.product.id ==
              orderedProduct.productDetails!.product.id &&
          item.selectedSize == orderedProduct.selectedSize) {
        bool isDecreased = item.decreaseCount();
        if (isDecreased) {
          totalPrice -= orderedProduct.productDetails!.product.priceAfterRebate;
          carItemsCount.value--;
        }
        update();
        return;
      }
    }
  }

  void setCurrentProduct(Product product) {
    currentProduct = product;
  }

  void setCurrentProductDetails(ProductDetails? productDetails) {
    currentProductDetails = productDetails!;
    currentProduct = productDetails.product;
  }

  void setSelectedSize(String size) {
    selectedSize.value = size;
  }

  Future getProductDetails() async {
    loading.value = true;
    currentProductDetails =
        await remoteRepo.getProductDetails(product: currentProduct);
    setSelectedSize(currentProductDetails.sizesMap.keys.toList()[0]);
    loading.value = false;
  }
}
