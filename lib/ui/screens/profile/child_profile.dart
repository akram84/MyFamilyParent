import 'package:flutter/material.dart';
import 'package:my_family/data/model/children/child.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../data/model/children/child_insights.dart';
import '../../helper/app_helper.dart';
import '../../resources/app_images.dart';
import '../../resources/app_text.dart';
import 'widgets/info.dart';
import 'widgets/insight.dart';

class ChildProfile extends StatelessWidget {
  const ChildProfile({Key? key, required this.child}) : super(key: key);

  final Child child;

  @override
  Widget build(BuildContext context) {
    List<Insights> insights = [
      Insights(name: 'Energy', percentage: 65, icon: AppImages.energy),
      Insights(name: 'Study', percentage: 88, icon: AppImages.study),
      Insights(name: 'Tasks', percentage: 76, icon: AppImages.tasks),
      Insights(name: 'Improvement', percentage: 46, icon: AppImages.improvement),
    ];
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
          Info(name: child.name, type: 'children', image: child.image),
          54.heightBox,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 158 / 69,
                crossAxisCount: 2,
                mainAxisSpacing: 27.w,
                crossAxisSpacing: 30.h,
                children: insights.map((insight) => Insight(insight: insight)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
