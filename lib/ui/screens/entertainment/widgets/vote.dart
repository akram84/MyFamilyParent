import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/repository/language_repository.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';
import 'package:my_family/ui/widgets/components.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/model/entertainment/entertainment.dart';
import '../../../../getx/controller/home/entertainments_controller.dart';

void showEntertainmentDialog(BuildContext context, Entertainment entertainment) {
  AwesomeDialog(
    context: context,
    animType: AnimType.bottomSlide,
    padding: EdgeInsets.zero,
    bodyHeaderDistance: 0.0,
    isDense: true,
    dialogType: DialogType.noHeader,
    body: Container(
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsetsDirectional.all(10.r),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsetsDirectional.only(top: 10.r, bottom: 20.r),
                  child: AppText.medium(text: entertainment.title??'')),
              ListView.separated(
                shrinkWrap: true,
                itemCount: entertainment.suggestions.length,
                itemBuilder: (c, index) {
                  final color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.5);
                  return InkWell(
                    onTap: () {
                      final controller = Get.put(EntertainmentsController());
                      controller.vote(context, entertainment.title, entertainment.suggestions[index].suggestion);
                    },
                    child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 40,
                        percent: (entertainment.suggestions[index].percentage??0) / 100,
                        barRadius: const Radius.circular(10),
                        isRTL: LanguageRepository.getLang == 'ar',
                        center: AppText.medium(text: entertainment.suggestions[index].suggestion??'', fontSize: 14, fontWeight: FontWeight.w400),
                        progressColor: color,
                        backgroundColor: const Color(0xFFF3F3F3),
                      ),
                      Container(
                          margin: EdgeInsetsDirectional.only(end: 10.w),
                          child: AppText.medium(text: '${(entertainment.suggestions[index].percentage??0).round()}%', color: const Color.fromRGBO(30, 178, 36, 40))),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 16.w),
                        alignment: AlignmentDirectional.centerStart,
                        child: Card(
                          elevation: 16,
                          color: color,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r)
                          ),
                          child: SizedBox(
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                    ],
                ),
                  );
                }, separatorBuilder: (BuildContext context, int index) => 16.heightBox,
              ),

              Container(
                margin: EdgeInsetsDirectional.only(top: 16.r, bottom: 8.r),
                child: AppWidgets.CustomButton(
                    text: 'Done',
                    width: 150.w,
                    height: 40.h,
                    radius: 50.r,
                    background: AppHelper.getAppTheme(),
                    borderColor: AppHelper.getAppTheme(),
                    click: () => pop(context)),
              )
            ],
          ),
        ),
      ).show();
}
