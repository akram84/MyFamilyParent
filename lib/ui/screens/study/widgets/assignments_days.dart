import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../../getx/controller/home/study_controller.dart';
import '../../../resources/index.dart';

class Days extends StatelessWidget {
  Days({Key? key}) : super(key: key);

  final _controller = Get.put(StudyController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudyController>(
      builder: (controller) =>  Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.separated(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.days.length,
          separatorBuilder: (c, i) => 10.widthBox,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => controller.selectDay(index),
              child: Container(
                width: 60.w,
                padding: EdgeInsets.all(5.w),
                decoration: controller.selectedDay == index ? AppBoxDecoration.txtGradientBlue200Gray30001 : AppBoxDecoration.outlineBlue200,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                          index == 0 ? 'Today' : '${controller.days[index].day}',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: controller.selectedDay == index ? AppTextStyles.txtRobotoRomanMedium12WhiteA700 : AppTextStyles.txtPoppinsBlack14,
                        ),
                      if(index != 0) Text(
                        AppDateFormatter.getFullDate(date: controller.days[index].toString(), format: 'EEEE'),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: controller.selectedDay == index ? AppTextStyles.txtRobotoRomanMedium12WhiteA700 :  AppTextStyles.txtRobotoRomanMedium10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
