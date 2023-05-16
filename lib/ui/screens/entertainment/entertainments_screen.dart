import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/getx/controller/home/entertainments_controller.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_routes.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import '../../../data/model/entertainment/entertainment.dart';
import '../../widgets/loading.dart';
import 'widgets/vote.dart';

class EntertainmentsScreen extends StatelessWidget {
  EntertainmentsScreen({super.key});

  final _controller = Get.put(EntertainmentsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:  AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'entertainment', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(AppHelper.iconBack(), height: 26.h, width: 26.w, fit: BoxFit.scaleDown,),
            onTap: () => Navigator.maybePop(context)),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                pushNameWOContext(AppRoutes.addEntertainments);
              })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _controller.getEntertainment(),
        child: GetBuilder<EntertainmentsController>(
          builder: (controller) {
            if(controller.entertainments == null) return const AppLoading();
            if(controller.entertainments!.isEmpty) return Center(child: ListView(shrinkWrap: true, children: [0.4.sh.heightBox, Center(child: AppText.medium(text: 'There is no Tasks to be done now')), 0.4.sh.heightBox]));
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.entertainments!.length,
              itemBuilder: (context, index) => buildEntertainment(context, index, controller.entertainments![index]));
          },
        ),
      ),
    );
  }

  Widget buildEntertainment(BuildContext context, int index, Entertainment entertainment) => GetBuilder<EntertainmentsController>(builder: (controller) {
    final selected = index == controller.selectedEnter;
    return Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: selected ? AppHelper.getAppTheme() : Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: Container(
      margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: InkWell(
        child: Row(
          children: [
            Image.asset(
                height: 100.h,
                width: 100.w,
                '${Const.images}def_image.png'),
            SizedBox(width: 12.w),
            AppText.medium(text: entertainment.title??'', color: selected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)
          ],
        ),
        onTap: (){
          controller.changeSelectedEnter(index);
          showEntertainmentDialog(context, entertainment);
        },
      ),
    ),
  );
  });
}
