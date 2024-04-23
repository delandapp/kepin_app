import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenzone/app/data/models/response_kategori.dart';

class kategoriBook extends StatelessWidget {
  const kategoriBook({super.key, required this.dataKategori});
  final List<DataKategori> dataKategori; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kategori",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                      .fontFamily,
                  fontSize: 17.0,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
              GestureDetector(
                  onTap: () => null,
                  child:const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: Color(0xFFFFFFFF),
                      ),
                      FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: Color(0xFFFFFFFF),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: Column(children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 138, 147, 0.7),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          dataKategori[1].namaKategori.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily:
                                GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                    .fontFamily,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(101, 0, 161, 0.7),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          dataKategori[2].namaKategori.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily:
                                GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                    .fontFamily,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 20,
                  child: Column(children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(101, 0, 161, 0.7),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          dataKategori[4].namaKategori.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily:
                                GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                    .fontFamily,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 138, 147, 0.7),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          dataKategori[5].namaKategori.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily:
                                GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                                    .fontFamily,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
