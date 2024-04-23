import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenzone/app/modules/detailbook/controllers/detailbook_controller.dart';

import '../data/constans/constans.dart';

class SliverSearch extends StatelessWidget {
  const SliverSearch({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final DetailbookController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverAppBar(
          backgroundColor: kDefaultIconDarkColor,
          elevation: 0,
          pinned: true,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(
                  controller.isAppBarExpanded.value ? -50.0 : 120.0),
              child: const SizedBox()),
          flexibleSpace: AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
        firstChild: const SizedBox(),
        secondChild: SearchBar(controller: controller,),
        crossFadeState:  controller.isAppBarExpanded.value
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        ),
      )
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.controller}) : super(key: key);
  final DetailbookController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: kSecondaryColor),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10,bottom: 20),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.arrow_back,color: Colors.white,),
                    Text("Detail Buku", style: TextStyle(
                          fontWeight: FontWeight.w900,
                          overflow: TextOverflow.visible,
                          fontFamily:
                              GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                  .fontFamily,
                          fontSize: 17.0,
                          color: const Color(0xFF000000),
                        ),)
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      controller.detailBuku.value.coverBuku.toString(),height: 110,),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.detailBuku.value.judulBuku!.length > 15
                          ? controller.detailBuku.value.judulBuku!
                                  .substring(0, 15) +
                              '...'
                          : controller.detailBuku.value.judulBuku.toString(),
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        overflow: TextOverflow.visible,
                        fontFamily:
                            GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 17.0,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    Text(
                      controller.detailBuku.value.penerbitBuku.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily:
                            GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 15.0,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    Text(
                      "${controller.detailBuku.value.penulisBuku.toString()} / ${controller.detailBuku.value.tahunTerbit.toString()}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily:
                            GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 15.0,
                        color: const Color(0xFFDDDDDD),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return Row(
    //   children: [
    //     Expanded(
    //       child: SizedBox.expand(
    //         child: ElevatedButton(
    //             onPressed: () {},
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: const Color(0XFF36969d),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(
    //                     MediaQuery.of(context).size.width * 0.000000),
    //               ),
    //             ),
    //             child: Text(
    //               'PINJAM',
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   color: Colors.white,
    //                   fontFamily:
    //                       GoogleFonts.baloo2(fontWeight: FontWeight.bold)
    //                           .fontFamily),
    //             ),
    //           ),
    //       ),
    //     ),
    //     Expanded(
    //       child: SizedBox.expand(
    //         child: ElevatedButton(
    //             onPressed: () {},
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: const Color(0XFF6500A1),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(
    //                     MediaQuery.of(context).size.width * 0.000000),
    //               ),
    //             ),
    //             child: Text(
    //               'SIMPAN',
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   color: Colors.white,
    //                   fontFamily:
    //                       GoogleFonts.baloo2(fontWeight: FontWeight.bold)
    //                           .fontFamily),
    //             ),
    //           ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
