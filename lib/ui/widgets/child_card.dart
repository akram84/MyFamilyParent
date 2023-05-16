import 'package:flutter/material.dart';
import 'package:my_family/data/model/children/child.dart';
import 'package:my_family/ui/helper/index.dart';

import '../resources/app_text.dart';
import '../screens/profile/child_profile.dart';
import 'app_image.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({Key? key, required this.child}) : super(key: key);

  final Child child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r)
        ),
        child: InkWell(
          onTap: ()=> pushPage(context, ChildProfile(child: child)),
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 16.r, top: 8.r, bottom: 8.r),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: AppImage(image: child.image, width: 80, height: 80),
                ),
                SizedBox(width: 12.w),
                AppText.medium(text: child.name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
