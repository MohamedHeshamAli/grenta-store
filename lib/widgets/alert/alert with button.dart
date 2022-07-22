import 'package:flutter/material.dart';
import 'package:grenta_store/common/common.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void AlertWithBtn(
    {required context,
    required String message,
    required String btnTxt,
    required Function onPressed}) {
  Alert(
    context: context,
    type: AlertType.warning,
    desc: message,
    buttons: [
      DialogButton(
        child: Text(
          btnTxt,
          style: textTitleStyle.copyWith(color: Colors.red),
        ),
        onPressed: () {
          onPressed();
          Navigator.pop(context);
        },
        width: 120,
      ),
      DialogButton(
        child: Text(
          "لا",
          style: textTitleStyle.copyWith(color: Colors.green),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      ),
    ],
  ).show();
}
