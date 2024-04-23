import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:zenzone/app/components/kategoriBook.dart';
import 'package:zenzone/app/components/koleksiBook.dart';
import 'package:zenzone/app/components/trendingBook.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(45, 46, 46, 1),
              Color.fromRGBO(0, 0, 0, 1)
            ])),
        // width: widthFullBody,
        child: controller.obx(
          (state) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: widthFullBody * 0.04, top: heightFullBody * 0.06),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: TextStyle(
                        height: 1.2,
                        fontWeight: FontWeight.w900,
                        fontFamily:
                            GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 37.0,
                        color: const Color(0xFFFFFFFF),
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Halo !\n',),
                        TextSpan(text: controller.username.value.toString(),style: TextStyle(fontWeight: FontWeight.w100,
                        fontSize: 25.0,
                        fontFamily:
                            GoogleFonts.audiowide(fontWeight: FontWeight.w100,fontSize: 25.0)
                                .fontFamily,)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightFullBody * 0.02,
                ),
                TrendingBook(dataPopular: state!.state1!),
                SizedBox(height: heightFullBody * 0.04),
                KoleksiBook(dataKoleksi: state.state2!),
                SizedBox(height: heightFullBody * 0.04),
                kategoriBook(dataKategori: state.state3!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
