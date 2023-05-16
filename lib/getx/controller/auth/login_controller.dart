import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/repository/user_repository.dart';
import 'package:my_family/ui/helper/navigator.dart';
import 'package:my_family/ui/resources/app_routes.dart';

import '../../../data/dto/auth/login.dart';
import '../../../data/repository/member/children_repo.dart';
import '../../../data/repository/member/helpers_repository.dart';
class LoginController extends GetxController{

  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late TextEditingController familyNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    familyNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
    // familyNameController.text = 'dev';
    // emailController.text = 'dev@gmail.com';
    // passwordController.text = 'Aa@12345678';
  }

  @override
  void dispose() {
    formKey.currentState!.reset();
    familyNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void login({required String familyName, required String email, required String password}) {
    bool isValidate = formKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      UserRepository.login(LoginDTO(familyName: familyName, email: email, password: password)).then((value) async{
        if (value != null) {
          isLoading(false);
          print(value.toJson());

          popAllAndPushNamesWOContext(AppRoutes.home);
          ChildrenRepo.getChildren();
          HelpersRepo.getHelpers();

          familyNameController.clear();
          emailController.clear();
          passwordController.clear();
        } else {
          isLoading(false);
        }
      }).catchError((error) {
        isLoading(false);
        print('catchError: $error');
      });
    } else {
      isLoading(false);
    }
  }

}