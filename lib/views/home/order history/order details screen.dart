import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/order%20history%20controller.dart';
import 'package:grenta_store/widgets/order/delivery%20tracking%20time%20line.dart';
import 'package:grenta_store/widgets/order/order%20detail.dart';
import 'package:grenta_store/widgets/order/ordered%20product.dart';
class OrderDetailsScreen extends StatelessWidget {
final _controller=Get.find<OrderHistoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: const Text("تفاصيل الطلب")),
      body: Column(
        children: [
          DeliveryTracking(deliveryTrackingEnum: _controller.selectedOrder.deliveryStatus),
          Expanded(child: ListView.builder(
            itemCount: _controller.selectedOrder.productsList.length,
          itemBuilder: (ctx,n)=>OrderedProductWidget(onTap: (){},orderedProduct:_controller.selectedOrder.productsList[n] ,)
          )),
          OrderDetailsWidget(order:_controller.selectedOrder,)
        ],
      ),
    );
  }
}
