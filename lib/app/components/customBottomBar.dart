import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:zenzone/app/modules/bookmark/views/bookmark_view.dart';
import 'package:zenzone/app/modules/explore/views/explore_view.dart';
import 'package:zenzone/app/modules/home/views/home_view.dart';
import 'package:zenzone/app/modules/kategori/views/kategori_view.dart';
import 'package:zenzone/app/modules/profile/views/profile_view.dart';

class CustomBottomBar extends StatelessWidget {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);


  List<Widget> screenDshboard() {
    return [
      const SafeArea(child: HomeView()),
      const SafeArea(child: ExploreView()),
      const SafeArea(child: BookmarkView()),
      const SafeArea(child: KategoriView()),
      const SafeArea(child: ProfileView()),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: FaIcon(FontAwesomeIcons.house),
        ),
        activeColorPrimary: const Color(0XFF008A93),
        inactiveColorPrimary: const Color(0xFF6500A1),
      ),
      PersistentBottomNavBarItem(
        icon: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: FaIcon(FontAwesomeIcons.magnifyingGlass),
        ),
        activeColorPrimary: const Color(0XFF008A93),
        inactiveColorPrimary: const Color(0xFF6500A1),
      ),
      PersistentBottomNavBarItem(
        icon: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: FaIcon(FontAwesomeIcons.bookBookmark),
        ),
        activeColorPrimary: const Color(0XFF008A93),
        inactiveColorPrimary: const Color(0xFF6500A1),
      ),
      PersistentBottomNavBarItem(
        icon: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: FaIcon(FontAwesomeIcons.boxArchive),
        ),
        activeColorPrimary: const Color(0XFF008A93),
        inactiveColorPrimary: const Color(0xFF6500A1),
      ),
      PersistentBottomNavBarItem(
        icon: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Icon(Icons.person_pin),
        ),
        activeColorPrimary: const Color(0XFF008A93),
        inactiveColorPrimary: const Color(0xFF6500A1),
      ),
    ];
  }

  CustomBottomBar({
    super.key,
    controller,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        controller: controller,
        screens: screenDshboard(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        navBarHeight: 65.0,
        backgroundColor: Colors.black,
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: const Duration(milliseconds: 500),
          curve: ElasticInOutCurve(20),
        ),
        screenTransitionAnimation: const  ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: ElasticInOutCurve(20),
          duration: const Duration(milliseconds: 500),
        ),
        navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    );
  }
}
