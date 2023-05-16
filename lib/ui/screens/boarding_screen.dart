import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/boarding.dart';
import 'package:my_family/getx/controller/boarding_controller.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/widgets/app_image.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/widgets/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends GetView<BoardingController> {
  BoardingScreen({super.key});

  final _controller = Get.put(BoardingController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller.pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: _controller.boarding.length,
              itemBuilder: (context, index) => pageViewScreens(_controller.boarding[index]),
              onPageChanged: (index) {
                if (index == _controller.boarding.length - 1) {
                  _controller.isLast.value = true;
                } else {
                  _controller.isLast.value = false;
                }
              },
            ),
          ),
          SizedBox(
            height: 220.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppWidgets.CustomButton(
                    width: 280.w,
                    height: 48.h,
                    radius: 14.r,
                    background: AppHelper.getAppTheme(),
                    borderColor: AppHelper.getAppTheme(),
                    fontWeight: FontWeight.w700,
                    isUpperCase: false,
                    text: 'join_our_community'.tr,
                    click: () => _controller.goToLogin(isLogin: false)),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(text: 'already_member'),
                    SizedBox(width: 10.w),
                    InkWell(
                        child: AppText.larg(
                            text: 'login', color: AppHelper.getAppTheme()),
                        onTap: () => _controller.goToLogin(isLogin: true)),
                  ],
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(
                      bottom: 28.r, start: 10.r, end: 10.r),
                  height: 20,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          child: AppText.medium(
                              text: 'skip',
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorSubText),
                          onTap: () => _controller.goToLogin(isLogin: true)),
                      SmoothPageIndicator(
                        controller: _controller.pageController,
                        count: 3,
                        effect: CustomizableEffect(
                          dotDecoration: DotDecoration(
                            height: 6.h,
                            width: 15.w,
                            color: HexColor(AppColors.grayColor),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          activeDotDecoration: DotDecoration(
                            height: 6.h,
                            width: 35.w,
                            color: AppHelper.getAppTheme(),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onDotClicked: (index) {
                          if (_controller.isLast.value) {
                            _controller.pageController.previousPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.easeInToLinear);
                          } else {
                            _controller.pageController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.easeInToLinear);
                          }
                        },
                      ),
                      InkWell(
                          child: AppText.medium(
                              text: 'next',
                              fontWeight: FontWeight.w500,
                              color: AppHelper.getAppTheme()),
                          onTap: () {
                            if (_controller.isLast.value) {
                              print('LAST');
                              _controller.goToLogin(isLogin: true);
                            } else {
                              print('NEXT');
                              _controller.pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInToLinear);
                            }
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pageViewScreens(Boarding boarding) => Container(
        margin: EdgeInsets.only(top: 20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppImage(imagePath: boarding.image, boxFit: BoxFit.cover,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 66.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                    child: AppText.medium(
                        fontWeight: FontWeight.w500,
                        text: boarding.description,
                        textAlign: TextAlign.start,
                        maxline: 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
