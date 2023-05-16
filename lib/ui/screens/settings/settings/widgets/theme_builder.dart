import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/theme.dart';
import 'package:my_family/getx/controller/home/settings_controller.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_text.dart';


Widget buildExpandedThemes(SettingsController controller) => ExpandableNotifier(
    child: SizedBox(
      width: 250,
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
                    text: 'themes',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            collapsed: Container(),
            expanded: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 5,
                  children: controller.listThemes.map((e) => buildAppThemeItem(e)).toList(),),
              ),
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

Widget buildAppThemeItem(AppTheme theme) => Container(
  margin: EdgeInsetsDirectional.all(7.r),
  child: GetBuilder<SettingsController>(builder: (controller) => InkWell(
    onTap: (){
      controller.saveTheme(theme);
      controller.update();
    },
    child: CircleAvatar(
      // radius: 10.5.r,
      backgroundColor: theme.isSelected ? AppColors.colorDark : Colors.transparent,
      child: CircleAvatar(
        radius: 10.r,
        backgroundColor: Color(theme.hexColor),
      ),
    ),
  )),
);