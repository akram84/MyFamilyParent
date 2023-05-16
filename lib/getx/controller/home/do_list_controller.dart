import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/model/children/child.dart';
import 'package:my_family/data/repository/home/todo_repository.dart';
import 'package:my_family/ui/helper/app_toast.dart';

import '../../../data/dto/home/add_task.dart';
import '../../../data/model/todo/todo_list.dart';

class ToDoListController extends GetxController {

  @override
  void onInit(){
    getTodos();
    super.onInit();
  }

  @override
  void dispose() {
    for (var subjectTitle in tasksControllers) {
      subjectTitle.dispose();
    }
    super.dispose();
  }

  List<int> listTasksCount = [1, 2, 3, 4, 5];

  RxInt tasksCount = 1.obs;
  Child? selectedChild;

  List<TextEditingController> tasksControllers = List.generate(5, (index) => TextEditingController());

  List<Todo>? todoList;
  void getTodos() async{
    todoList = await TodoRepository().getTodos();
    update();
  }

  int selectedIndex = 0;
  void changeSelected(index){
    selectedIndex = index;
    update();
  }

  void addTask() async{
    if(selectedChild == null){
      AppToast.toast(msg: 'You have to select a child');
      print('You have to select a child');
      return;
    }

    List<Task> tasks = tasksControllers.sublist(0, tasksCount.value).map((e) => Task(task: e.text)).toList();
    bool ret = false;
    tasks.forEach((task) {
     if(task.task.isEmpty){
       AppToast.toast(msg: 'Task cannot be empty');
       print('Task cannot be empty');
       ret = true;
       return;
     }
    });
    if(ret)return;

    final success = await TodoRepository().addTask(AddTaskDTO(childId: selectedChild?.id??'', tasks: tasks));
    if(success) {
      getTodos();
      clear();
    }
  }

  clear() {
    selectedIndex = 0;
    tasksCount.value = 1;
    selectedChild = null;
    tasksControllers.forEach((e) => e.clear());
    update();
  }
}