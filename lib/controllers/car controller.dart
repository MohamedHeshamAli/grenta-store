import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/models/product%20details.dart';
import 'package:grenta_store/models/product.dart';
import 'package:grenta_store/widgets/alert/alert%20message.dart';

import '../models/ordered product.dart';

class CarController extends GetxController {
  late Product currentProduct;
  ProductDetails currentProductDetails = ProductDetails(
    product: Product(
      id: "id",
      quant: 3,
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
  RxBool loading = false.obs;
  List<OrderedProduct> carItemsList = [];
  RxString selectedSize = "".obs;
  RxInt carItemsCount = 0.obs;
  double totalPrice = 0.0;
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
    totalPrice -=
        (orderedProduct.getCount() * orderedProduct.product.priceAfterRebate);
    carItemsCount.value -= orderedProduct.getCount();
    orderedProduct.resetCount();
    carItemsList.remove(orderedProduct);
    update();
    //toDo increase the quan of order quan
  }

  void addProduct(context) {
    for (OrderedProduct item in carItemsList) {
      if (item.product.id == currentProduct.id &&
          item.selectedSize == selectedSize.value) {
        bool isAdded = item.increaseCount();
        if (isAdded) {
          carItemsCount.value++;
          totalPrice += (currentProduct.priceAfterRebate);
          update();
        } else {
          AlertMessage(context, "لايمكنك اضافة المزيد");
        }

        return;
      }
    }
    OrderedProduct newOrder = OrderedProduct(
        product: currentProduct, selectedSize: selectedSize.value);
    bool isAdded = newOrder.increaseCount();
    if (isAdded) {
      totalPrice += newOrder.product.priceAfterRebate;
      carItemsList.add(newOrder);
      carItemsCount.value++;
      update();
    } else {
      AlertMessage(context, "لايمكنك اضافة المزيد");
    }
  }

  void incrementProduct(
      {required OrderedProduct orderedProduct, required context}) {
    for (OrderedProduct item in carItemsList) {
      if (item.product.id == orderedProduct.product.id &&
          item.selectedSize == orderedProduct.selectedSize) {
        bool isAdded = item.increaseCount();
        if (isAdded) {
          totalPrice += orderedProduct.product.priceAfterRebate;
          carItemsCount.value++;
          update();
        } else {
          AlertMessage(context, "لايمكنك اضافة المزيد");
        }
        return;
      }
    }
    OrderedProduct newOrder = OrderedProduct(
        product: currentProduct, selectedSize: selectedSize.value);
    bool isAdded = newOrder.increaseCount();
    if (isAdded) {
      totalPrice += newOrder.product.priceAfterRebate;
      carItemsList.add(newOrder);
      carItemsCount.value++;
      update();
    } else {
      AlertMessage(context, "لايمكنك اضافة المزيد");
    }
    //toDo decrease the quan of order quan
  }

  void decrementProduct({required OrderedProduct orderedProduct}) {
    for (OrderedProduct item in carItemsList) {
      if (item.product.id == orderedProduct.product.id &&
          item.selectedSize == orderedProduct.selectedSize) {
        bool isDecreased = item.decreaseCount();
        if (isDecreased) {
          totalPrice -= orderedProduct.product.priceAfterRebate;
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

  void setSelectedSize(String size) {
    selectedSize.value = size;
  }

  void setProductDetails() async {
    loading.value = true;
    currentProductDetails =
        await remoteRepo.getProductDetails(product: currentProduct);
    setSelectedSize(currentProductDetails.sizesList[0]);
    loading.value = false;
  }
}
