import 'package:flutter/material.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../widgets/app_bar.dart';
import 'widgets/about_item.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'about'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: const [
            About(title: 'about_app', body: 'about_app_body'),
            About(title: 'our_vision', body: 'our_vision_body'),
            About(title: 'our_mission', body: 'our_mission_body'),
            About(title: 'our_service', body: 'our_service_body'),
          ],
        ),
      ),
    );
  }
}
