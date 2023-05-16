import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/getx/controller/auth/create_account_controller.dart';
import 'package:my_family/ui/resources/app_color.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {
  CreateAccountScreen({super.key});

  final _controller = Get.put(CreateAccountController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: GetBuilder<CreateAccountController>(builder: (controller) => PageView.builder(
          controller: _controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _controller.listPages.length,
          itemBuilder: (context, index) => controller.listPages[index])),
    );
  }
}
