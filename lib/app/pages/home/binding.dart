import 'package:dream/app/pages/calander/controller.dart';
import 'package:dream/app/pages/community/controller.dart';
import 'package:dream/app/pages/dream/controller.dart';
import 'package:dream/app/pages/home/controller.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<CalanderPageController>(() => CalanderPageController());
    Get.lazyPut<DreamPageController>(() => DreamPageController());
    Get.lazyPut<CommunityPageController>(() => CommunityPageController());
  }
}
