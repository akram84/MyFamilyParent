import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/todo/todo_list.dart';
import 'package:my_family/getx/controller/home/do_list_controller.dart';
import 'package:my_family/ui/helper/index.dart';
import 'package:my_family/ui/resources/app_color.dart';
import 'package:my_family/ui/resources/app_routes.dart';
import 'package:my_family/ui/resources/app_text.dart';
import 'package:my_family/ui/screens/do_list/child_todo.dart';
import 'package:my_family/ui/widgets/app_image.dart';
import 'package:my_family/ui/helper/app_helper.dart';

import '../../widgets/loading.dart';
class TodoListScreen extends GetView<Todo> {
  TodoListScreen({super.key});
  final _controller = Get.put(ToDoListController());


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'to_do_list', color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.maybePop(context)),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                 pushName(context, AppRoutes.addTodo);
              })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _controller.getTodos(),
        child: GetBuilder<ToDoListController>(
          builder: (controller) {
            if(controller.todoList == null) return const AppLoading();
            if(controller.todoList!.isEmpty) return Center(child: ListView(shrinkWrap: true, children: [0.4.sh.heightBox, Center(child: AppText.medium(text: 'There is no Tasks to be done now')), 0.4.sh.heightBox]));
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(parent:  BouncingScrollPhysics()),
              itemCount: controller.todoList!.length,
              itemBuilder: (context, index) => buildStudy(context, controller.todoList![index], index));
          },
        ),
      ),
    );
  }
  Widget buildStudy(BuildContext context, Todo todo, int index) => GetBuilder<ToDoListController>(builder: (controller) {
    final selected = index == controller.selectedIndex;
    return Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: selected ? AppHelper.getAppTheme() : Colors.white,
    elevation: 8,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r)
    ),
    child: Container(
      margin: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: InkWell(

        child: Container(
          margin:const EdgeInsetsDirectional.only(top: 8, bottom: 8),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: AppImage(image: todo.child?.image, width: 80, height: 80,),
              ),
              SizedBox(width: 12.w),
              AppText.medium(text: todo.child?.name??'',  color: selected ? Colors.white : Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)
            ],
          ),
        ),
        onTap: (){
          controller.changeSelected(index);
          pushPage(context, ChildTodo(todo: todo));
        },
      ),
    ),
  );
  });
}
