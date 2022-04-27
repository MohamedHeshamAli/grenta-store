import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/models/category.dart';
import 'package:grenta_store/models/product.dart';

class HomeController extends GetxController {
  RxInt selectedNaveBar = 1.obs;
  RxBool loadingScreen = false.obs;
  RxBool loadingProducts = true.obs;
  RxBool canGetMoreProducts = false.obs;
  RxBool loadingMoreProducts = false.obs;
  Rx<Product> selectedProduct = Product(
    id: "id",
    quant: 3,
    name: "name",
    price: 0,
    mainImageURL: "mainImageURL",
  ).obs;
  Rx<Category> selectedCategory = Category(
    id: " id",
    imageURL: "imageURL",
    name: "name",
  ).obs;
  RxList<Category> categoryList = [
    Category(
      id: " id",
      imageURL: "imageURL",
      name: "name",
    )
  ].obs;
  RxList<Product> productList = [
    Product(
      id: "id",
      quant: 3,
      name: "name",
      price: 0,
      mainImageURL: "mainImageURL",
    )
  ].obs as RxList<Product>;
  Future setCategoryList() async {
    loadingScreen.value = true;
    await Future.delayed(Duration(seconds: 2));
    categoryList.value = [];
    categoryList.value = await remoteRepo.getCategories();
    selectedCategory.value = categoryList.value[0];
    loadingScreen.value = false;
  }

  void setMoreProducts() async {
    loadingMoreProducts.value = true;
    await Future.delayed(Duration(seconds: 2));
    List<Product> newProducts = await remoteRepo.getMoreProducts(
      categoryId: selectedCategory.value.id,
    );
    print(productList.length);
    productList.value.addAll(newProducts);
    print(productList.length);
    loadingMoreProducts.value = false;
  }

  Future setCategoryProductsList() async {
    loadingProducts.value = true;
    await Future.delayed(Duration(seconds: 2));
    productList.value = [];
    productList.value = await remoteRepo.getCategoryProducts(
        categoryId: selectedCategory.value.id);
    loadingProducts.value = false;
  }

  void changeCategory(Category category) async {
    if (selectedCategory.value != category) {
      selectedCategory.value = category;
      setCategoryProductsList();
    }
  }

  void changingNavBar(int val) {
    selectedNaveBar.value = val;
  }
}
