import 'package:get/get.dart';
import 'package:grenta_store/models/order.dart';
import 'package:grenta_store/models/ordered%20product.dart';
import 'package:grenta_store/models/product.dart';
class OrderHistoryController extends GetxController {
  var ordersList = RxList<Order>([]).obs;
  var orderedProductsList = RxList<OrderedProduct>([]).obs;
  late Order selectedOrder;
  RxBool loading = false.obs;
  Future setOrders()async{
    loading.value=true;
    ordersList.value.clear();
    //TODO get orders api

    ordersList.value.add(Order(
        orderNmunber: 123, date: "22-5-2022",
        deliveryStatus: DeliveryEnum.received,
        recevierName: "عبدو", totalPayed: 120,
        productsList: [
          OrderedProduct(selectedSize: "s",product: Product(
          id: "2",
          rebate: 30,
          name: "تيشيرت",
          price: 60,
          mainImageURL:
          "https://dfcdn.defacto.com.tr/7/V2887AZ_22SP_GR91_02_01.jpg",
        ),
        count: 2,orderNumber: 123)]));
    ordersList.value.add(Order( deliveryStatus: DeliveryEnum.received,
        orderNmunber: 125, date: "22-5-2022",
        recevierName: "عبدو", totalPayed: 25,
        productsList: [OrderedProduct(selectedSize: "s",product:  Product(
          id: "1",
          name: "سوي تيشيرت",
          price: 80,
          mainImageURL:
          "https://dfcdn.defacto.com.tr/7/W6108AZ_22SP_BK81_01_01.jpg",
        ),
        count: 2,orderNumber: 240)]));
    setOrderedProducts();
    loading.value=false;
  }
  void setOrderedProducts(){
    orderedProductsList.value.clear();
    for(Order order in ordersList.value){
      orderedProductsList.value.addAll(order.productsList);
    }
  }
  void setSelectedOrder(int ? productNum){
    for(Order order in ordersList.value){
      if(order.orderNmunber==productNum) {
        selectedOrder = order;
        return;
      }
    }

  }
}