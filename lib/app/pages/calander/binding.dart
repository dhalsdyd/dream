import 'package:dream/app/pages/calander/controller.dart';
import 'package:get/get.dart';

class CalanderPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalanderPageController>(() => CalanderPageController());
  }
}
