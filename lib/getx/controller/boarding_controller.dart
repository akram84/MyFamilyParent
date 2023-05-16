import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/boarding.dart';
import 'package:my_family/data/repository/auth_repository.dart';

import '../../ui/helper/navigator.dart';
import '../../ui/resources/app_images.dart';
import '../../ui/resources/app_routes.dart';

class BoardingController extends GetxController {
  final PageController pageController = PageController();
  RxBool isLast = false.obs;
  List<Boarding> boarding = [
    Boarding(image: AppImages.boarding1, description: ''),
    Boarding(image: AppImages.boarding2, description: 'Want a walking group? Walk friends! It is a community of the connects girls to create walking groups.'),
    Boarding(image: AppImages.boarding3, description: 'Want a walking group? Walk friends! It is a community of the connects girls to create walking groups.'),
  ];
  
  void goToLogin({required bool isLogin}) async{
    await AuthRepository().setOnBoarding();
    isLogin
        ? popAllAndPushNamesWOContext(AppRoutes.login)
        : popAllAndPushNamesWOContext(AppRoutes.createAccount);
  }
}
