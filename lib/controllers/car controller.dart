import 'package:get/get.dart';
import 'package:grenta_store/models/product%20details.dart';
import 'package:grenta_store/models/product.dart';

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
  Rx<OrderedProduct> currentOrderedProduct = OrderedProduct(
          product:
              Product(price: 0, quant: 3, id: "0", mainImageURL: "", name: ""),
          selectedSize: "")
      .obs;
  void setCurrentOrderedProduct(OrderedProduct orderedProduct) {
    currentOrderedProduct.value = orderedProduct;
    currentOrderedProduct.value.product = currentProduct;
  }

  void removeProduct() {
    carItemsList.remove(currentProduct);
    update();
    //toDo increase the quan of order quan
  }

  void addProduct() {
    for (OrderedProduct item in carItemsList) {
      if (item.product.id == currentProduct.id &&
          item.selectedSize == selectedSize.value) {
        bool isAdded = item.increaseCount();
        if (isAdded) {
          carItemsCount.value++;
        }
        update();
        return;
      }
    }
    OrderedProduct newOrder = OrderedProduct(
        product: currentProduct, selectedSize: selectedSize.value);
    newOrder.increaseCount();
    carItemsList.add(newOrder);
    carItemsCount.value++;
    update();
  }

  void incrementProduct({required OrderedProduct orderedProduct}) {
    for (OrderedProduct item in carItemsList) {
      if (item.product.id == orderedProduct.product.id &&
          item.selectedSize == orderedProduct.selectedSize) {
        bool isAdded = item.increaseCount();
        if (isAdded) {
          carItemsCount.value++;
        }
        update();
        return;
      }
    }
    OrderedProduct newOrder = OrderedProduct(
        product: currentProduct, selectedSize: selectedSize.value);
    newOrder.increaseCount();
    carItemsList.add(newOrder);
    carItemsCount.value++;
    update();
    //toDo decrease the quan of order quan
  }

  void decrementProduct({required OrderedProduct orderedProduct}) {
    for (OrderedProduct item in carItemsList) {
      if (item.product.id == orderedProduct.product.id &&
          item.selectedSize == orderedProduct.selectedSize) {
        bool isDecreased = item.decreaseCount();
        if (isDecreased) {
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

  void setProductDetails(ProductDetails productDetails) async {
    loading.value = true;
    currentProductDetails = ProductDetails(
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
    loading.value = false;
  }
}
