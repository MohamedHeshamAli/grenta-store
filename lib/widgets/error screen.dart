import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grenta_store/widgets/my%20button.dart';

class ErrorScreen extends StatelessWidget {
  final Function tryAgainFun;

  ErrorScreen({Key? key, required this.tryAgainFun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("حدث خطأ اثناء التحميل"),
          MyButton(
              onPressed: () {
                tryAgainFun();
              },
              label: "المحاوله مجدداً")
        ],
      ),
    );
  }
}
