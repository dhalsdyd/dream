import 'package:dream/app/pages/dream/controller.dart';
import 'package:get/get.dart';

class DreamPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DreamPageController>(() => DreamPageController());
  }
}
