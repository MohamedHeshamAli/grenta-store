import 'package:grenta_store/models/category.dart';
import 'package:grenta_store/models/product.dart';

class RemoteRepo {
  Future<List<Category>> getCategories() async {
    List<Category> categoryList = [];

    Category category = Category(
        id: "1",
        imageURL: "https://dfcdn.defacto.com.tr/7/M4793AZ_NS_BG694_01_01.jpg",
        name: "تيشيرت رجالي");
    categoryList.add(category);
    category = Category(
        id: "2",
        imageURL: "https://dfcdn.defacto.com.tr/7/W6108AZ_22SP_BK81_01_01.jpg",
        name: "سوي تشيرت رجالي");
    categoryList.add(category);

    return categoryList;
  }

  Future<List<Product>> getCategoryProducts(
      {required String categoryId}) async {
    List<Product> productList = [];

    if (categoryId == "1") {
      for (int i = 0; i < 10; i++) {
        Product product = Product(
          id: "$i",
          rebate: 30,
          name: "تيشيرت",
          price: 60,
          mainImageURL:
              "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_GR91_02_01.jpg",
        );
        productList.add(product);
      }
    } else {
      for (int i = 10; i < 20; i++) {
        Product product = Product(
          id: "$i",
          name: "سوي تيشيرت",
          price: 60,
          mainImageURL:
              "https://dfcdn.defacto.com.tr/7/W6466AZ_22SP_GN920_01_02.jpg",
        );
        productList.add(product);
      }
    }
    return productList;
  }

  Future<List<Product>> getMoreProducts({required String categoryId}) async {
    List<Product> productList = [];
    for (int i = 0; i < 10; i++) {
      Product product = Product(
        id: "id",
        rebate: 30,
        name: "تيشيرت",
        price: 60,
        mainImageURL:
            "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_GR91_02_01.jpg",
      );
      productList.add(product);
    }
    return productList;
  }
}
