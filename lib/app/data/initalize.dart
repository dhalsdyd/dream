import 'package:dream/app/data/controllers/lifecycle.dart';
import 'package:dream/app/pages/calander/controller.dart';
import 'package:get/get.dart';

class AppInitalizer {
  Future<void> init() async {
    Get.put<LifeCycleController>(LifeCycleController());
    Get.put<CalanderPageController>(CalanderPageController());

    // await Get.putAsync<DatabaseController>(() => DatabaseController().init());
    // await Get.putAsync<AuthController>(() => AuthController().init());
  }
}
