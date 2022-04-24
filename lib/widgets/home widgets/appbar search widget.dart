import 'package:flutter/material.dart';

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(10),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.grey,
        decoration: const InputDecoration(
          hintText: "البحث عن منتج ",
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }
}
