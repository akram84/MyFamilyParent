
import 'package:get/get.dart';
import 'package:my_family/getx/controller/boarding_controller.dart';
import 'package:my_family/getx/controller/splash_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(BoardingController());
  }
}
