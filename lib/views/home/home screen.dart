
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/controllers/home%20controller.dart';
import 'package:grenta_store/controllers/internet%20controller.dart';
import 'package:grenta_store/views/order%20history/orders%20history%20screen.dart';
import 'package:grenta_store/widgets/CircularIndicator.dart';
import 'package:grenta_store/widgets/car/carbutton.dart';
import 'package:grenta_store/widgets/home%20widgets/Catergory%20list.dart';
import 'package:grenta_store/widgets/home%20widgets/appbar%20search%20widget.dart';
import 'package:grenta_store/widgets/home%20widgets/products%20grid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomeScreen extends StatelessWidget {
  final _controller = Get.put(HomeController());
  final InternetController _internetController = Get.put(InternetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: GetX<HomeController>(builder: (_) {
          return BottomNavigationBar(
            selectedItemColor: primaryCollor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.shifting,
            currentIndex: _controller.selectedNaveBar.value,
            onTap: (i) {
              if(_controller.selectedNaveBar.value!=i){
              _controller.changingNavBar(i);
              }
            },
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: appBarColor,
                  label: "طلباتي",
                  icon: Icon(
                    Icons.local_shipping,
                  )),
              BottomNavigationBarItem(
                  backgroundColor: appBarColor,
                  label: "تسوق",
                  icon: Icon(
                    Icons.home,
                  )),
              BottomNavigationBarItem(
                  backgroundColor: appBarColor,
                  label: "حسابي",
                  icon: Icon(
                    Icons.manage_accounts,
                  ))
            ],
          );
        }),
        appBar: AppBar(
          actions: [
            Center(child: CarBtn()),
            const SizedBox(
              width: 15,
            ),
          ],
          title: AppBarSearch(),
        ),
        body:

        GetX<HomeController>(
          initState: (_) async {
            await _controller.setCategoryList();
            await _controller.setCategoryProductsList();
          },
          builder: (_) {
            return _controller.loadingScreen.value
                ? const CircularIndicator()
                : Column(
                    children: [
                      CategoryList(),
                      _controller.loadingProducts.value
                          ? const Center(child: CircularIndicator())
                          : ProductsGrid()
                    ],
                  );
          },
        ));
  }
}
