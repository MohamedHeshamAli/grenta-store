import 'package:grenta_store/common.dart';
import 'package:grenta_store/models/product.dart';

void main() async {
  List<Product> list = await remoteRepo.getCategoryProducts(categoryId: "1");

}
