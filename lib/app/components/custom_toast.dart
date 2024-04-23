import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

class CustomToast{
  static Future<bool?> ShowToast(String message,Color background,Color colorText){
    return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: background,
    textColor: colorText,
    );
  }
}