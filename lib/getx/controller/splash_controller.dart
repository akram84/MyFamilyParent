
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:my_family/data/repository/auth_repository.dart';
import 'package:my_family/ui/resources/app_routes.dart';

import '../../ui/helper/navigator.dart';


class SplashController extends GetxController {
  bool boarding = AuthRepository().isOnBoarding();

  @override
  void onInit() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    startApp();
    super.onInit();
  }

  Future startApp() {
    if (!boarding) {
      if(AuthRepository().accessToken != null){
        return Future.delayed(
            const Duration(seconds: 5), () => popAllAndPushNamesWOContext(AppRoutes.home));
      }else{
        return Future.delayed(
            const Duration(seconds: 5), () => popAllAndPushNamesWOContext(AppRoutes.login));
      }
    } else {
      return Future.delayed(
         const Duration(seconds: 5), () => popAllAndPushNamesWOContext(AppRoutes.boarding));
    }
  }

}

class TestImage {

  static Future convert(GlobalKey context) async {
    RenderRepaintBoundary? boundary = context.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    final image = await boundary!.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngByte = byteData!.buffer.asUint8List();
    return pngByte;
  }
}
