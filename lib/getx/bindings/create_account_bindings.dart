
import 'package:get/get.dart';
import 'package:my_family/getx/controller/auth/create_account_controller.dart';

class CreateAccountBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountController());
  }
}