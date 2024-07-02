import 'package:dream/app/pages/community/controller.dart';
import 'package:get/get.dart';

class CommunityPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityPageController>(() => CommunityPageController());
  }
}
