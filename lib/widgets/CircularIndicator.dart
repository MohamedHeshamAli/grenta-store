import 'package:flutter/material.dart';
import 'package:grenta_store/common/common.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: primaryCollor,
    ));
  }
}
