import 'package:get/get.dart';
import 'package:zenzone/app/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:zenzone/app/modules/explore/controllers/explore_controller.dart';
import 'package:zenzone/app/modules/home/controllers/home_controller.dart';
import 'package:zenzone/app/modules/kategori/controllers/kategori_controller.dart';
import 'package:zenzone/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ExploreController>(
      () => ExploreController(),
    );
    Get.lazyPut<BookmarkController>(
      () => BookmarkController(),
    );
    Get.lazyPut<KategoriController>(
      () => KategoriController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
