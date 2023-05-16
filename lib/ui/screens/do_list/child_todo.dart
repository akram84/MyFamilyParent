import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/todo/todo_list.dart';
import 'package:my_family/getx/controller/home/do_list_controller.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../../data/model/todo/tasks.dart';
import '../../helper/app_helper.dart';
import '../../resources/app_color.dart';
import '../../resources/app_text.dart';
import '../../widgets/child_card.dart';

class ChildTodo extends StatelessWidget {
  ChildTodo({super.key, required this.todo});

  final _controller = Get.put(ToDoListController());

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'to_do_list',
            color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ChildCard(child: todo.child!),
          GetBuilder<ToDoListController>(
            builder: (controller) => Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: todo.tasks!.length,
                  itemBuilder: (context, index) => buildTodo(context, todo.tasks![index])),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildTodo(BuildContext context, Task task) => GetBuilder<ToDoListController>(builder: (controller) => Card(
    margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 10.r, bottom: 10.r),
    color: task.done??false ? AppHelper.getAppTheme() : AppColors.lightGray7,
    elevation: 5,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: task.done,
          onChanged: (done){
            task.done = done;
            _controller.update();
          },
        ),
        AppText.medium(text: task.task??'', color:  Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w400)
      ],
    ),
  ));

}
