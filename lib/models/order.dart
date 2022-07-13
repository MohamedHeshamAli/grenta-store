import 'package:grenta_store/models/ordered%20product.dart';
enum DeliveryEnum{
  notShaped,
  ready,
  received,
}
class Order {
  String? id;
  int orderNmunber;
  String date,recevierName;
  double totalPayed;
  DeliveryEnum deliveryStatus;
  List<OrderedProduct>productsList;
  Order({this.id,
    required this.deliveryStatus,
  required this.orderNmunber,
    required this.date,required this.recevierName,
    required this.totalPayed,required this.productsList,});
}
