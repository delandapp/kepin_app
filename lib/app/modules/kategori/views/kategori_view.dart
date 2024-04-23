import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx((state) => SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color.fromRGBO(45, 46, 46, 1),
                      Color.fromRGBO(0, 0, 0, 1)
                    ])),
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state!.length,
                  itemBuilder: (BuildContext context, int index) {
                    int rowIndex = index ~/ 2; // Hitung indeks baris
                    double itemHeight = rowIndex % 2 == 0
                        ? index.isEven
                            ? 100.0
                            : 150.0
                        : index.isEven
                            ? 150.0
                            : 100.0;
                    double fontSize = rowIndex % 2 == 0
                        ? index.isEven
                            ? 20.0
                            : 10.0
                        : index.isEven
                            ? 10.0
                            : 20.0;
                    Color colorItem = rowIndex % 2 == 0
                        ? index.isEven
                            ? const Color.fromRGBO(101, 0, 161, 0.7)
                            : const Color.fromRGBO(0, 138, 147, 0.7)
                        : index.isEven
                            ? const Color.fromRGBO(0, 138, 147, 0.7)
                            : const Color.fromRGBO(101, 0, 161,
                                0.7); // Tentukan tinggi item berdasarkan indeks baris
                    return Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: itemHeight,
                      decoration: BoxDecoration(
                        color: colorItem,
                      ),
                      child: Text(
                        state[index].namaKategori.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: fontSize,
                          fontFamily:
                              GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                  .fontFamily,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )));
  }
}
