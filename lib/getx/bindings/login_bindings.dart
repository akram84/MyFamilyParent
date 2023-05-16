
import 'package:get/get.dart';
import 'package:my_family/getx/controller/auth/login_controller.dart';

class LoginBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}