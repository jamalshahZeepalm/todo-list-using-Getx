import 'package:get/get.dart';
import 'package:todogetx/app/modules/home/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
  }
}
