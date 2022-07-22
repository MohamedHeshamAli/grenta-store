import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common/common.dart';
import 'package:grenta_store/controllers/car%20controller.dart';
import 'package:grenta_store/views/login/login%20screen.dart';
import 'package:grenta_store/widgets/car/car%20order%20card.dart';

class CarScreen extends StatelessWidget {
  CarScreen({Key? key}) : super(key: key);
  final CarController _controller = Get.find<CarController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarController>(
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "الاجمالي",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "${_controller.totalPrice.toString()} جنيه",
                    style: textNameStyle,
                  )
                ],
              ),
              const Spacer(),
              Material(
                color: appBarColor,
                child: InkWell(
                  onTap: () {
                    if (currentCustomer == null) {
                      Get.to(LoginScreen(
                        isHome: false,
                      ));
                    }
                  },
                  child: const SizedBox(
                    height: kToolbarHeight - 10,
                    width: 100,
                    child: Center(
                      child: Text(
                        'طلب',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          appBar: AppBar(
            title: const Text(
              "عربة التسوق",
            ),
          ),
          body: ListView.builder(
            itemCount: _controller.carItemsList.length,
            itemBuilder: (ctx, n) {
              return CarOrderCard(orderedProduct: _controller.carItemsList[n]);
            },
          ),
        );
      },
    );
  }
}
