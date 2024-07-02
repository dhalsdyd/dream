import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/pages/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  BottomNavigationBarItem _bottomNavItem(String imageUrl, String label) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset("assets/icons/$imageUrl.svg"), activeIcon: SvgPicture.asset("assets/icons/${imageUrl}_fill.svg"), label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(index: controller.pageIndex, children: controller.pages),
      ),
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: DreamColors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: DreamColors.white,
            currentIndex: controller.pageIndex,
            onTap: controller.changePage,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            fixedColor: DreamColors.mainColor,
            unselectedItemColor: DreamColors.mainColor,
            items: [
              _bottomNavItem("calendar", "캘린더"),
              _bottomNavItem("dream", "꿈방"),
              _bottomNavItem("community", "커뮤니티"),
              _bottomNavItem("my", "마이"),
            ],
          ),
        );
      }),
    );
  }
}
