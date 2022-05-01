import 'package:grenta_store/models/category.dart';
import 'package:grenta_store/models/product%20details.dart';
import 'package:grenta_store/models/product.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteRepo {
  final String _baseurl = "localhost:5000";
  Future<List<Category>> getCategories() async {
    List<Category> categoryList = [];
    var respons = await http.get(Uri.http(_baseurl, "categories/all", {}));

    if (respons.statusCode == 200) {
      List data = jsonDecode(respons.body);
      for (var jsonMap in data) {
        Category category = Category.fromJson(jsonMap);
      }
    } else {
      throw Exception((e) => print(e));
    }
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

    try {
      var response = await http.get(Uri.http(_baseurl, "/api/products/all"));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);

        for (var productJson in data) {
          Product product = Product.fromJson(productJson);
          productList.add(product);
        }
      } else {
        throw Exception((e) => print(e));
      }
    } catch (e) {
      print(e);
    }

    // if (categoryId == "1") {
    //   for (int i = 0; i < 10; i++) {
    //     Product product = Product(
    //       id: "$i",
    //       rebate: 30,
    //       quant: 3,
    //       name: "تيشيرت",
    //       price: 60,
    //       mainImageURL:
    //           "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_GR91_02_01.jpg",
    //     );
    //     productList.add(product);
    //   }
    // } else {
    //   for (int i = 10; i < 20; i++) {
    //     Product product = Product(
    //       id: "$i",
    //       quant: 3,
    //       name: "سوي تيشيرت",
    //       price: 90,
    //       mainImageURL:
    //           "https://dfcdn.defacto.com.tr/7/W6108AZ_22SP_BK81_01_01.jpg",
    //     );
    //     productList.add(product);
    //   }
    // }
    return productList;
  }

  Future<List<Product>> getMoreProducts({required String categoryId}) async {
    List<Product> productList = [];
    for (int i = 0; i < 10; i++) {
      Product product = Product(
        id: "id",
        quant: 3,
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

  Future<ProductDetails> getProductDetails({required Product product}) async {
    var response = await http.get(Uri.http(_baseurl, "", {}));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      for (var jsonMap in data) {
        ProductDetails productDetails =
            ProductDetails.fromJson(jsonMap, product);
      }
    } else {
      throw Exception((e) => print(e));
    }
    if (product.id.length == 1) {
      return ProductDetails(
        product: product,
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
    } else {
      return ProductDetails(
        product: product,
        detailsImagesURLList: [
          "https://dfcdn.defacto.com.tr/7/W6108AZ_22SP_BK81_01_01.jpg",
          "https://dfcdn.defacto.com.tr/7/W6108AZ_22SP_BK81_02_01.jpg",
          "https://dfcdn.defacto.com.tr/7/W6108AZ_22SP_BK81_04_01.jpg",
          "https://dfcdn.defacto.com.tr/7/W6108AZ_22SP_BK81_05_01.jpg",
        ],
        productDescription: "سويت شيرت بأكمام طويلة ورقبة دائرية وطبعة عادية",
        quantity: 10,
        sizesList: ["S", "L", "XL", "XXL", "XXXL"],
      );
    }
  }

  Future<void> createNewAccount() async {
    var response =
        await http.post(Uri.http(_baseurl, "customers/add", {}), body: {
      "name": "abdo1",
      "phoneNo1": "1",
      "phoneNo2": "1",
      "city": {"id": 1},
      "address": "giza",
      "distract": "cairo",
      "email": "abdo",
      "notes": "1",
      "status": "s",
      "password": "1"
    });
  }

  Future<void> login({required String email, required String passwor}) async {
    var response = await http.get(Uri.http(_baseurl, "customers/all"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
    } else {
      throw Exception((e) => print(e));
    }
  }
}
