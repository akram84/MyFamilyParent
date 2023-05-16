import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/data/model/helper/helper.dart';
import 'package:my_family/data/repository/member/children_repo.dart';
import 'package:my_family/data/repository/user_repository.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_routes.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/screens/profile/child_profile.dart';
import 'package:my_family/ui/screens/profile/helper_profile.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import '../../../../data/model/children/child.dart';
import '../../../../data/repository/member/helpers_repository.dart';
import '../../settings/notifications_screen.dart';

class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});



  @override
  Widget build(BuildContext context) {
  List<String> familyMemberTypes = ['parents', 'children', 'helpers'];
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
          fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'family', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => pushNameWOContext(AppRoutes.settings)),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () => pushPage(context, const NotificationsScreen())),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
          itemCount: familyMemberTypes.length,
          itemBuilder: (context, index) => Align(
            alignment: AlignmentDirectional.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w).add(EdgeInsets.only(top: 25.h)),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: AppHelper.getAppTheme(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 11),
                child: ExpandableTheme(
                    data: const ExpandableThemeData(useInkWell: true),
                    child: Container(child: buildExpandedFamilyMembers(familyMemberTypes[index]))),
              ),
            ),
          )),
    );
  }

  Widget buildExpandedFamilyMembers(String memberType) {
    List<dynamic> members = [];
    final user = UserRepository.getUser;
    switch(memberType){
      case 'parents':
        if(user?.parentEmail != null && user!.parentEmail!.isNotEmpty)members.add(user.parentEmail!);
        if(user?.otherParentEmail != null && user!.otherParentEmail!.isNotEmpty && user.otherParentEmail != user.parentEmail)members.add(user.otherParentEmail!);
        break;
      case 'children':
        members = ChildrenRepo.children;
        break;
      case 'helpers':
        members = HelpersRepo.helpers;
        break;
    }
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            iconColor: Colors.white,
            expandIcon: Icons.arrow_drop_down_sharp,
            collapseIcon: Icons.arrow_drop_up_sharp,
            iconSize: 30,
          ),
          header: Container(
            margin: EdgeInsetsDirectional.only(bottom: 10.r, start: 20.r),
            decoration: BoxDecoration(
                color: AppHelper.getAppTheme(),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Container(
              child: AppText.medium(
                text: memberType,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
          ),
          collapsed: Container(),
          expanded: Container(
            color: Colors.white,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return buildFamilyMembers(members[index], context, memberType);
                }),
          ),
          builder: (_, collapsed, expanded) {
            return Expandable(
              collapsed: collapsed,
              expanded: expanded,
              theme: const ExpandableThemeData(crossFadePoint: 0),
            );
          },
        ),
      ));
  }

  Widget buildFamilyMembers(dynamic member, context, memberType) {
    return InkWell(
    onTap: () {
      switch(memberType) {
        case 'children':
          pushPage(context, ChildProfile(child: member as Child));
          break;
        case 'helpers':
          pushPage(context, HelperProfile(helper: member as Helper));
          break;
      }
    },
    child: Container(
      width: double.infinity,
      height: 70.h,
      margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 8),
      padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
      color: AppColors.lightWhite,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('${Const.images}default_avatar.png'),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.medium(text: memberType == 'parents' ? member.split('@')[0] : member.name, fontWeight: FontWeight.w500,),
              AppText.medium(text: memberType == 'parents' ? member : member.email, fontWeight: FontWeight.w400, color: AppColors.colorSubText),
            ],
          ),
          const Spacer(),
          const Icon(Icons.location_on, color: AppColors.colorSubText),
        ],
      ),
    ),
  );
  }
}
