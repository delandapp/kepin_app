import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zenzone/app/components/customBottomBar.dart';
import 'package:zenzone/app/modules/bookmark/views/bookmark_view.dart';
import 'package:zenzone/app/modules/explore/views/explore_view.dart';
import 'package:zenzone/app/modules/home/views/home_view.dart';
import 'package:zenzone/app/modules/kategori/views/kategori_view.dart';
import 'package:zenzone/app/modules/profile/views/profile_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: IndexedStack(
          index: controller.tabIndex,
          children: const [HomeView(), ExploreView(), BookmarkView(), KategoriView(), ProfileView()],
        )),
      ),
      bottomNavigationBar: CustomBottomBar(
        controller: controller.changeTabIndex,
      ),
    );
  }
}
