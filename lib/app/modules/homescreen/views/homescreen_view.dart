import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenzone/app/routes/app_pages.dart';

import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  const HomescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomescreenView'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(45, 46, 46, 1),
                Color.fromRGBO(0, 0, 0, 1)
              ])),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 40, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat',
                  style: GoogleFonts.audiowide(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(0, 240, 255, 0.7),
                          fontSize: 60)),
                ),
                Text(
                  'Datang !',
                  style: GoogleFonts.audiowide(
                      textStyle: TextStyle(
                          color: Color.fromRGBO(0, 240, 255, 0.7),
                          fontSize: 40)),
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image(
                                      image: AssetImage('assets/images/LOGO.png'),
                                      width: MediaQuery.of(context).size.width * 0.8,
                                    ),
                    )),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 5),
                          child: Text('Masuk',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  fontFamily:
                                      GoogleFonts.audiowide().fontFamily)),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(0, 138, 147, 0.7),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 5),
                          child: Text('Daftar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  fontFamily:
                                      GoogleFonts.audiowide().fontFamily)),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(101, 0, 161, 0.7),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
