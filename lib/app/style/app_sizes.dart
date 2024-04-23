import 'package:flutter/material.dart';

class AppSizes{
  late double sizeWidth;
  late double sizeHeight;
  late double sizeTopBar;
  late double sizeBody;

  AppSizes(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double topBarHeight = MediaQuery.of(context).padding.top;

    // Masukan size di variabel
    sizeWidth = screenSize.width;
    sizeHeight = screenSize.height;
    sizeTopBar = topBarHeight;
    sizeBody = sizeHeight - sizeTopBar;
  }
}