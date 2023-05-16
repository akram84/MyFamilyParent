import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_family/core/constants.dart';
import 'package:my_family/core/cubit/home/home_cubit.dart';
import 'package:my_family/data/model/home_type.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_routes.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/helper/app_helper.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    HomeCubit home = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'home', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: Container(),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics:
          const NeverScrollableScrollPhysics(),
          itemCount: home.listHomeType.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 14,
            childAspectRatio: 100 / 95,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) => buildHomeTypeItem(index, home.listHomeType[index])),
    );
  }

  Widget buildHomeTypeItem(int index, HomeType type) => BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    HomeCubit home = BlocProvider.of(context);
    final selected = index == home.selectedHomeType;
    return Container(
    margin: const EdgeInsets.all(20),
    child: InkWell(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        color: selected ? AppHelper.getAppTheme() : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('${Const.images}${type.image}', fit: BoxFit.scaleDown),
            SizedBox(height: 8.h),
            AppText.medium(text: type.title, color: selected ? Colors.white : Colors.black, fontSize: 16, fontWeight: FontWeight.w500)
          ],
        ),
      ),
      onTap: () {
        home.selectHomeType(index);

        if(index == 0){
          pushNameWOContext(AppRoutes.entertainments);
        }else if(index == 1){
          pushNameWOContext(AppRoutes.study);
        }else if(index == 2) {
          pushNameWOContext(AppRoutes.todoList);
        }
      },
    ),
  );
  },
);
}
