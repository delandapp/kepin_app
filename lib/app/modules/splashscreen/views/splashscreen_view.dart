import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zenzone/app/routes/app_pages.dart';

import '../controllers/splashscreen_controller.dart';
import 'package:lottie/lottie.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.offAllNamed(Routes.HOMESCREEN);
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Lottie.asset("assets/Splash-Screen.json")),
            CircularProgressIndicator()
          ],
        ),
      )
    );
  }
}
