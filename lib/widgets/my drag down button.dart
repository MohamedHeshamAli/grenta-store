import 'package:flutter/material.dart';
import 'package:grenta_store/common/common.dart';

class MyDropDownButton extends StatelessWidget {
  String initVal;
  List<String> valuesList;
  Function onChange;
  String label;
  MyDropDownButton({
    required this.valuesList,
    required this.label,
    required this.initVal,
    required this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 2))
      ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          const SizedBox(
            width: 40,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "$label : ",
              style: textTitleStyle.copyWith(color: appBarColor),
            ),
          ),
          DropdownButton<String>(
            value: initVal,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: textTitleStyle.copyWith(color: appBarColor),
            onChanged: (newValue) {
              onChange(newValue);
            },
            items: valuesList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
