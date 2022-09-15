import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  AppToast._();

  static showToast(
    String message, {
    Color backgroundColor= Colors.white,
    Toast duration= Toast.LENGTH_LONG,
    Color textColor= Colors.black,
    ToastGravity gravity= ToastGravity.CENTER,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: duration,
      gravity: gravity,
      backgroundColor: backgroundColor,
      timeInSecForIosWeb: 3,
      textColor: textColor,
      fontSize: 14,
    );
  }
}
