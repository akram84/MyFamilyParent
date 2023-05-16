import 'package:flutter/cupertino.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_family/data/model/todo/todo.dart';
import 'package:my_family/ui/helper/app_toast.dart';

import '../../dto/home/add_task.dart';
import '../../model/todo/todo_list.dart';
import '../../utils/api_path.dart';
import '../../utils/api_service.dart';

class TodoRepository{

  Future<List<Todo>> getTodos() async{
    try {
      final response = await ApiService.getApi(ApiPaths.getTodos);
      Logger.w(response.data);
      if(response.statusCode == 200){
        final List<Todo> todos = ToDoList.fromJson(response.data).toDoList??[];
        AppToast.toast(msg: 'Todo list retrieved');
        return todos;
      } else {
        AppToast.toast(msg: 'Todo list retrieving failed');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      AppToast.toast(msg: 'Todo list retrieving failed');
    }
    return [];
  }

  Future<bool> addTask(AddTaskDTO addTaskDTO) async{
    try {
      final response = await ApiService.postApi(ApiPaths.addTodo, body: addTaskDTO.toJson());
      if(response.statusCode == 200){
        AppToast.toast(msg: response.data['message']??'Task added successfully');
      } else {
        AppToast.toast(msg: 'Couldn\'t add tasks');
      }
      return response.data['success'];
    } on Exception catch (e) {
      debugPrint(e.toString());
      AppToast.toast(msg: 'Couldn\'t add tasks');
      return false;
    }
  }
}