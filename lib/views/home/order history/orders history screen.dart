import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/controllers/order%20history%20controller.dart';
import 'package:grenta_store/views/home/order%20history/order%20details%20screen.dart';
import 'package:grenta_store/widgets/CircularIndicator.dart';
import 'package:grenta_store/widgets/order/ordered%20product.dart';
class OrdersHistoryScreen extends StatelessWidget {
  final _controller=Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text("طلباتي"),
    ),body:
    GetX<OrderHistoryController>(
      initState: (_)async{
        await _controller.setOrders();
      },
      builder: (_){
        return ListView.builder(
          itemCount: _controller.orderedProductsList.value.length,
            itemBuilder: (ctx,n)
            {
                if(_controller.loading.value) {
                  return const CircularIndicator();
                } else if(_controller.ordersList.value.isEmpty){
                  return const Center(
                    child:  Text("لا يوجد طلبات",style: textHints,),
                  );
                }
                else{
                  return OrderedProductWidget(
                      onTap: () {
                        _controller.setSelectedOrder(
                            _controller.orderedProductsList.value[n].orderNumber);

                        Get.to(OrderDetailsScreen());
                      },
                      orderedProduct: _controller.orderedProductsList.value[n]);
                }
            },);
      },
    ),
    );
  }
}
