import 'package:google_fonts/google_fonts.dart';
import 'package:zenzone/app/components/sliver_app_bar.dart';
import 'package:zenzone/app/components/sliver_list.dart';
import 'package:zenzone/app/components/sliver_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zenzone/app/routes/app_pages.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: controller.obx(
          (state) => SafeArea(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: kDefaultIconDarkColor),
              child: Obx(
                () => Stack(
                  children: [
                    Positioned(
                        top: 20,
                        left: 20,
                        right: 20,
                        child: controller.isAppBarExpanded.value
                            ? GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Detail Buku",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        overflow: TextOverflow.visible,
                                        fontFamily: GoogleFonts.audiowide(
                                                fontWeight: FontWeight.w600)
                                            .fontFamily,
                                        fontSize: 17.0,
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox()),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox.expand(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.PINJAM);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0XFF36969d),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.000000),
                                    ),
                                  ),
                                  child: Text(
                                    'PINJAM',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: GoogleFonts.baloo2(
                                                fontWeight: FontWeight.bold)
                                            .fontFamily),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Expanded(
                                child: SizedBox.expand(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.addKoleksiBuku();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(controller.detailBuku.value.koleksi! ? 0xFF8B322C : 0XFF6500A1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery.of(context).size.width *
                                                0.000000),
                                      ),
                                    ),
                                    child: Text(
                                      controller.detailBuku.value.koleksi! ? "DISIMPAN" : "SIMPAN",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: GoogleFonts.baloo2(
                                                  fontWeight: FontWeight.bold)
                                              .fontFamily),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 70,
                      left: 0,
                      right: 0,
                      bottom: 50,
                      child: CustomScrollView(
                        controller: controller.scrollController,
                        slivers: [
                          SliverAppBarBldr(
                              image: state!.state1!.coverBuku.toString()),
                          SliverSearch(
                            controller: controller,
                          ),
                          SliverListBldr(
                            dataUlasan: state.state2,
                            controller: controller,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
