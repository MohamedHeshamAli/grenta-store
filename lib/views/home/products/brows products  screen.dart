import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:grenta_store/views/home/home%20screen/navigation%20drawer%20widget.dart';
import 'package:grenta_store/widgets/CircularIndicator.dart';
import 'package:grenta_store/widgets/car/carbutton.dart';
import 'package:grenta_store/widgets/home%20widgets/Catergory%20list.dart';
import 'package:grenta_store/widgets/home%20widgets/appbar%20search%20widget.dart';
import 'package:grenta_store/widgets/home%20widgets/products%20grid.dart';

import '../../../controllers/home controller.dart';
class BrowsProductsScreen extends StatelessWidget {
final _controller = Get.find<HomeController>();

   BrowsProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        leading: IconButton(icon:const Icon(Icons.menu),onPressed: (){
          ZoomDrawer.of(context)!.toggle();

        }),
        actions: [
          Center(child: CarBtn()),
          const SizedBox(
            width: 15,
          ),
        ],
        title: AppBarSearch(),
      ),
      body: GetX<HomeController>(
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
      ),
    );
  }
}
