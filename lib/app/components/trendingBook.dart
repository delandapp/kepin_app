import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenzone/app/data/models/response_book_popular.dart';
import 'package:zenzone/app/routes/app_pages.dart';

class TrendingBook extends StatelessWidget {
  const TrendingBook({
    super.key,
    required this.dataPopular,
  });

  final List<DataBookPopular> dataPopular;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Trending",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily:
                  GoogleFonts.audiowide(fontWeight: FontWeight.w600).fontFamily,
              fontSize: 17.0,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: ColoredBox(
            color: const Color(0XFF919292),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              width: double.infinity,
              child: GridView.builder(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3/4.4
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : dataPopular[index].bukuID.toString()}),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        dataPopular[index].coverBuku.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                itemCount: dataPopular.length,
              ),
            ),
          ),
        )
      ],
    );
  }
}
