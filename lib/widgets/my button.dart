import 'package:flutter/material.dart';
import 'package:grenta_store/common.dart';

class MyButton extends StatelessWidget {
  MyButton({Key? key, required this.onPressed, required this.label});
  final Function onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: FloatingActionButton.extended(
        onPressed: () {
          onPressed();
        },
        backgroundColor: appBarColor,
        label: Text(
          label,
          textAlign: TextAlign.center,
          style: textTitleStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
