import 'package:flutter/material.dart';
import 'package:grenta_store/common/common.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void alertMessage(context, String message) {
  Alert(
    context: context,
    type: AlertType.error,
    desc: message,
    buttons: [
      DialogButton(
        child: const Text(
          "حسناً",
          style: textTitleStyle,
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}
