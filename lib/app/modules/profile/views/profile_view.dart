import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zenzone/app/data/provider/storage_provider.dart';
import 'package:zenzone/app/routes/app_pages.dart';
import 'package:zenzone/app/style/app_sizes.dart';

import '../../../style/app_colors.dart';
import '../../../style/app_textsizes.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    AppSizes sizes = AppSizes(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundOnboarding.withOpacity(0.30),
        titleSpacing: 13,
        title: Text(
          'Profile Pengguna',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
            color: AppColors.blackColor,
            fontSize: AppTextSizes.textButton,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: (){
              },
              child: const Icon(
                Iconsax.refresh5,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor,
        ),
      ),
      body: Container(
         decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(45, 46, 46, 1),
              Color.fromRGBO(0, 0, 0, 1)
            ])),
        width: sizes.sizeWidth,
        height: sizes.sizeHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/profil.png',
                      width: 65,
                      height: 65,
                    ),
                  ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StorageProvider.read(StorageKey.username).toString(),
                              style: GoogleFonts.montserrat(
                                  fontSize: AppTextSizes.body,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor
                              ),
                            ),

                            Text(
                              StorageProvider.read(StorageKey.email).toString(),
                              style: GoogleFonts.montserrat(
                                  fontSize: AppTextSizes.body,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackColor
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
                ),
              ),

              const Divider(
                color: AppColors.backgroundOnboarding,
                height: 2,
              ),

              const SizedBox(height: 20),

              sectionButtonProfile(sizes.sizeWidth, sizes.sizeWidth, Iconsax.information5, "Profile User", (){}),

              const SizedBox(height: 10),

              sectionButtonProfile(sizes.sizeWidth, sizes.sizeWidth, Iconsax.activity, "History Pinjam",(){Get.toNamed(Routes.HISTORY);}),
              const SizedBox(height: 10),

              sectionButtonProfile(sizes.sizeWidth, sizes.sizeWidth, Iconsax.logout5, "Logout",(){controller.logout();}),
            ],
          ),
        ),
      )
    );
  }

  Widget sectionButtonProfile(double width, double height, IconData iconDepan, String text, Function() onTap){
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.backgroundOnboarding.withOpacity(0.60),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Icon(iconDepan),
              const SizedBox(width: 10),
              Text(text, style: GoogleFonts.montserrat(
                fontSize: AppTextSizes.body,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
