import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zenzone/app/data/models/response_ulasan.dart';
import 'package:zenzone/app/modules/detailbook/controllers/detailbook_controller.dart';

import '../data/constans/constans.dart';

class SliverListBldr extends StatelessWidget {
  const SliverListBldr({
    Key? key,
    required this.controller,
    required this.dataUlasan
  }) : super(key: key);
  final List<DataUlasan>? dataUlasan;
  final DetailbookController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Obx(
              () => Container(
                decoration: BoxDecoration(
                  borderRadius: controller.isAppBarExpanded.value
                      ? kBorderRadius
                      : BorderRadius.circular(0),
                  color: kSecondaryColor,
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          controller.detailBuku.value.judulBuku.toString(),
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            overflow: TextOverflow.visible,
                            fontFamily: GoogleFonts.audiowide(
                                    fontWeight: FontWeight.w600)
                                .fontFamily,
                            fontSize: 27.0,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          controller.detailBuku.value.penulisBuku.toString(),
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.visible,
                            fontFamily: GoogleFonts.audiowide(
                                    fontWeight: FontWeight.w600)
                                .fontFamily,
                            fontSize: 20.0,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "${controller.detailBuku.value.penerbitBuku.toString()} / ${controller.detailBuku.value.tahunTerbit.toString()}",
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.visible,
                            fontFamily: GoogleFonts.audiowide(
                                    fontWeight: FontWeight.w600)
                                .fontFamily,
                            fontSize: 20.0,
                            color: const Color.fromARGB(255, 127, 127, 127),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        controller.detailBuku.value.deskripsi.toString(),
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.visible,
                          fontFamily:
                              GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                  .fontFamily,
                          fontSize: 17.0,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ColoredBox(
                        color: Color(0xFF6500A1),
                        child: SizedBox(
                          height: 2,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Penilaian & Ulasan",
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.visible,
                          fontFamily:
                              GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                  .fontFamily,
                          fontSize: 17.0,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RatingBarIndicator(
                            direction: Axis.horizontal,
                            rating:
                                controller.detailBuku.value.rating!.toDouble(),
                            itemCount: 5,
                            itemSize: 44,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color(0xFF6500A1),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            "${controller.detailBuku.value.rating!.toStringAsFixed(1)} dari 5",
                            style: TextStyle(
                                fontFamily: GoogleFonts.audiowide(
                                        fontWeight: FontWeight.w600)
                                    .fontFamily,
                                fontSize: 17),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          TRatingBar(
                            text: "5",
                            value: controller.detailBuku.value.detailRating![4],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TRatingBar(
                            text: "4",
                            value: controller.detailBuku.value.detailRating![3],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TRatingBar(
                            text: "3",
                            value: controller.detailBuku.value.detailRating![2],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TRatingBar(
                            text: "2",
                            value: controller.detailBuku.value.detailRating![1],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TRatingBar(
                            text: "1",
                            value: controller.detailBuku.value.detailRating![0],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Bagaimana pengalaman Anda?',
                            style: TextStyle(
                                fontFamily: GoogleFonts.audiowide(
                                        fontWeight: FontWeight.w900)
                                    .fontFamily,
                                fontSize: 17),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                              validator:
                                  ValidationBuilder().minLength(5).build(),
                              obscureText: false,
                              autocorrect: false,
                              controller: controller.ulasanController,
                              autofocus: false,
                              keyboardType: TextInputType.multiline,
                              textAlign: TextAlign.left,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Tuliskan pengalaman Anda',
                                hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily:
                                        GoogleFonts.audiowide().fontFamily),
                                filled: true,
                                fillColor: Colors.grey,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 17, 0))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 17, 0))),
                                // border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2)),
                              )),
                          const SizedBox(height: 10),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color(0xFF6500A1),
                            ),
                            onRatingUpdate: (rating) {
                              // Kirim nilai rating ke server atau lakukan tindakan lain
                              controller.ratingStar.value = rating;
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Obx(
                              () => ElevatedButton(
                                onPressed: () {
                                  // Aksi ketika tombol ditekan
                                  controller.addUlasan();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0XFF36969d),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.2),
                                  ),
                                ),
                                child: controller.loading.value
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        'Kirim',
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.audiowide(
                                                    fontWeight: FontWeight.w600)
                                                .fontFamily,
                                            fontSize: 17),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                              ),
                            ),
                          ),
                          buildUlasanList()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: 1,
        ),
      ),
    );
  }
Widget buildUlasanList() {
    final width = MediaQuery.of(Get.context!).size.width;

    return dataUlasan!.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataUlasan!.length,
            itemBuilder: (context, index) {
              DataUlasan ulasan = dataUlasan![index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(140),
                          ),
                          child: Image.asset("assets/profil.png"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ulasan.username ?? '',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF000000),
                              fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBarIndicator(
                      direction: Axis.horizontal,
                      rating: ulasan.rating!.toDouble(),
                      itemCount: 5,
                      itemSize: 18,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ulasan.ulasan ?? '',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 17.0),
                    ),
                  ],
                ),
              );
            },
          )
        : Container(
            width: width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFF424242),
                width: 0.5,
              ),
            ),
            child: Text(
              'Belum ada ulasan buku',
              style: GoogleFonts.inriaSans(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          );
  }
  }

class TRatingBar extends StatelessWidget {
  const TRatingBar({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontFamily:
                  GoogleFonts.audiowide(fontWeight: FontWeight.w600).fontFamily,
              fontSize: 17),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Expanded(child: SizedBox()),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 20,
            backgroundColor: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            valueColor: const AlwaysStoppedAnimation(Color(0xFF6500A1)),
          ),
        )
      ],
    );
  }
}
