import 'package:flutter/material.dart';
import 'package:grenta_store/common.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  String? Function(String?)? validator;
  IconData? icon;
  Widget? suffix;
  bool isPassword;
  bool isReadOnly;
  Function()? onTap;
  void Function(String)? onChanged;
  TextInputType? keyboardType;
  MyTextField(
      {Key? key,
      this.suffix,
      this.keyboardType,
      required this.validator,
      this.onChanged,
      this.isReadOnly = false,
      this.onTap,
      required this.controller,
      required this.label,
      this.icon,
      this.isPassword = false})
      : super(key: key);
  // : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: TextFormField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: isReadOnly,
          validator: validator,
          controller: controller,
          obscureText: isPassword,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: appBarColor),
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            suffixIcon: suffix,
            label: Text(
              label,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: appBarColor,
              ),
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 2))
        ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
      );
}
