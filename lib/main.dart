import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/core/localization/local.dart';
import 'package:my_family/data/utils/api_service.dart';
import 'package:my_family/data/utils/app_local_storage.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_routes.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import 'core/cubit/notifications/notifications_cubit.dart';
import 'getx/bindings/app_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage.init();
  await ApiService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) =>
          BlocProvider(
            create: (context) => NotificationsCubit()..getNotifications(),
            child: GetMaterialApp(
              title: 'My Family',
              navigatorKey: Const.navigatorKey,
              debugShowCheckedModeBanner: false,

              darkTheme: ThemeData(primaryColor: AppHelper.getAppTheme(),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                      secondary: AppHelper.getAppTheme())),

              locale: AppHelper.getAppLocale(),
              translations: MyTranslations(),

              initialRoute: AppRoutes.splash,
              onGenerateRoute: RouteGenerator.generateRoute,
              initialBinding: AppBindings(),
              // getPages: AppRoutes.routesPages,
            ),
          ),
    );
  }
}
