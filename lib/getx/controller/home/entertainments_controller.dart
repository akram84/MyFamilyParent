import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/dto/home/add_entertainment.dart';
import '../../../data/model/entertainment/entertainment.dart';
import '../../../data/model/entertainment/suggestions.dart';
import '../../../data/repository/home/entertainment_repo.dart';
import '../../../ui/helper/app_toast.dart';

class EntertainmentsController extends GetxController {



  late GlobalKey<FormState> formKey;
  late TextEditingController titleEnterainmentsController;
  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    titleEnterainmentsController = TextEditingController();
    getEntertainment();
    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.reset();
    titleEnterainmentsController.dispose();
    super.dispose();
  }


  List<Entertainment>? entertainments;
  void getEntertainment() async{
    entertainments = await EntertainmentRepository().getEntertainments();
    update();
  }

  int selectedEnter = 0;
  void changeSelectedEnter(index) {
    selectedEnter = index;
    update();
  }

  RxInt suggestionsCount = 1.obs;
  List<int> listSuggestionsCount = [1, 2, 3, 4, 5];
  List<TextEditingController> suggestionsControllers = List.generate(5, (index) => TextEditingController());

  addEntertainment() async{
    List<String> entertainment = suggestionsControllers.sublist(0, suggestionsCount.value).map((e) => e.text).toList();

    if(formKey.currentState?.validate()??false){
      bool ret = false;
      entertainment.forEach((enter) {
        if(enter.isEmpty){
          AppToast.toast(msg: 'Task cannot be empty');
          print('Task cannot be empty');
          ret = true;
          return;
        }
      });
      if(ret)return;

      final success = await EntertainmentRepository().addEntertainment(AddEntertainmentDTO(title: titleEnterainmentsController.text, suggestions: entertainment.map((e) => Suggestions(suggestion: e)).toList()));
      if(success) {
        clear();
        getEntertainment();
      }
    }
  }

  clear(){
    selectedEnter = 0;
    suggestionsCount.value = 1;
    titleEnterainmentsController.clear();
    suggestionsControllers.forEach((e) => e.clear());
    update();
  }

  vote(context, title, suggestion) async{
    final success = await EntertainmentRepository().vote(context, title, suggestion);
    if(success) getEntertainment();
  }
}
