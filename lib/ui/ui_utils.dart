import 'package:flutter/cupertino.dart';

class UIUtils{

  static double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static openKeyboard() => FocusManager.instance.primaryFocus?.requestFocus();

}