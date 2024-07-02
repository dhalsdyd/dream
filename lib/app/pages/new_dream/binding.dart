import 'package:dream/app/pages/new_dream/controller.dart';
import 'package:get/get.dart';

class NewDreamPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewDreamPageController>(() => NewDreamPageController());
  }
}
