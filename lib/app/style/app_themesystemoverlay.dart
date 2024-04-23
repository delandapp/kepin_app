import 'package:flutter/services.dart';

class SystemOverlayStyleUtils{
  static void setLightStatusBar(Color background) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: background,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static void setDarkStatusBar(Color background) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: background,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
}