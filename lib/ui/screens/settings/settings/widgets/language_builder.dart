import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/language.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import '../../../../../getx/controller/home/settings_controller.dart';



Widget buildExpandedLanguage(SettingsController controller) => ExpandableNotifier(
    child: SizedBox(
      width: 230,
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: SizedBox(
          width: 200,
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              iconColor: AppColors.colorBackground,
              expandIcon: Icons.arrow_drop_up_sharp,
              collapseIcon: Icons.arrow_drop_down_sharp,
              iconSize: 30,
            ),
            header: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                child: AppText.medium(
                    text: 'language',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            collapsed: Container(),
            expanded: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)
              ),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.listLanguages.length,
                  itemBuilder: (context, index) => buildLanguageItem(controller.listLanguages[index]),
                  separatorBuilder: (context, index) => Container(
                    width: 280,
                    height: 2.h,
                    color: Colors.grey,
                  )),
            ),
            builder: (_, collapsed, expanded) {
              return Expandable(
                collapsed: collapsed,
                expanded: expanded,
                theme: const ExpandableThemeData(crossFadePoint: 0),
              );
            },
          ),
        ),
      ),
    ));

Widget buildLanguageItem(Language language) => Container(
  margin: EdgeInsetsDirectional.only(end: 10.r),
  child: GetBuilder<SettingsController>(builder: (controller) => Row(
    children: [
      Container(
        width: 150,
        alignment: AlignmentDirectional.topStart,
        child: RadioListTile<String>(
            activeColor: AppHelper.getAppTheme(),
            value: language.languageCode, groupValue: controller.languageSelected, onChanged: (value){
          for(Language language in controller.listLanguages){
            language.isSelected = false;
          }
          language.isSelected = true;
          controller.languageSelected = value.toString();
          print('VALUE SELECTED: ${value.toString()}');
          print('LANG SELECTED: ${controller.languageSelected}');
          controller.saveLanguage(language.languageCode);
          controller.update();

        }),
      ),
      Container(
          alignment: AlignmentDirectional.centerEnd,
          child: AppText.medium(
              text: language.language == 'arabic' ? 'arabic'.tr : 'english'.tr, textAlign: TextAlign.end)),
    ],
  )),
);