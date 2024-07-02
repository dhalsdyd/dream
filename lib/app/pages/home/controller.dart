import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/pages/calander/page.dart';
import 'package:dream/app/pages/community/page.dart';
import 'package:dream/app/pages/dream/page.dart';
import 'package:dream/app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin {
  static HomePageController get to => Get.find<HomePageController>(); // add this line

  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;

  final _pages = [Routes.calander, Routes.dream, Routes.community, '/my'];

  List<Widget> pages = [
    CalanderPage(),
    const DreamPage(),
    const CommunityPage(),
    Container(
      color: DreamColors.black,
    )
  ];

  void changePage(int index) {
    if (_pageIndex.value == index) return;
    if (_pages[index] == '') return;
    _pageIndex(index);
    //Get.offAllNamed(_pages[index], id: _navigatorKey);
  }
}
