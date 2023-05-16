import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';

import '../../../data/model/helper/helper.dart';
import '../../helper/app_helper.dart';
import '../../resources/app_text.dart';
import '../../resources/app_text_styles.dart';
import '../../widgets/helper_permissions.dart';
import 'widgets/info.dart';

class HelperProfile extends StatelessWidget {
  const HelperProfile({Key? key, required this.helper}) : super(key: key);

  final Helper helper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'profile',
            color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),
      ),
      body: Column(
        children: [
          32.heightBox,
          Info(name: helper.name??'', type: 'helpers', image: helper.image),
          35.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("email_address".tr, style: AppTextStyles.txtRobotoRomanRegular16Black900),
                11.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(helper.email??'', style: AppTextStyles.txtRobotoRomanRegular14Gray500),
                ),
              ],
            ),
          ),
          18.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Divider(color: AppColors.black90033, thickness: 1.5),
          ),
          15.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("permissions".tr, style: AppTextStyles.txtRobotoRomanRegular16Black900),
                19.heightBox,
                HelperPermissions(
                  onSelect: (selected) {
                    // TODO: REQUEST CHANGE PERMISSIONS
                  },
                  selected: helper.permissions,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
