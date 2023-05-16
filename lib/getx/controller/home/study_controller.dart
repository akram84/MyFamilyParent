import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_family/data/dto/home/add_study.dart';

import '../../../data/model/children/child.dart';
import '../../../data/model/study/study.dart';
import '../../../data/model/study/subjects.dart';
import '../../../data/repository/home/study_repo.dart';
import '../../../ui/helper/app_toast.dart';

class StudyController extends GetxController {




  @override
  void onInit(){
    getStudies();
    days = List.generate(_days, (index) => DateTime.now().copyWith(day: index + 1, hour: 0, minute: 0, second: 0)).reversed.toList();
    super.onInit();
  }
  @override
  void dispose() {
    for (var subjectTitle in subjectsTitles) {
      subjectTitle.dispose();
    }
    super.dispose();
  }

  RxInt subjectsCount = 1.obs;
  List<int> counts = [1, 2, 3, 4];

  /// Selected Study
  int selectedStudyIndex = 0;
  void changeSelectedStudy(index){
    selectedStudyIndex = index;
    update();
  }
  /// Selected Subject
  int selectedSubjectIndex = 0;
  void changeSelectedSubject(index){
    selectedSubjectIndex = index;
    update();
  }

  List<TextEditingController> subjectsTitles = List.generate(5, (index) => TextEditingController());

  Child? selectedChild;



  /// Days
  int selectedDay = 0;
  List<DateTime> days = [];
  final int _days = DateTime.now().difference(DateTime.now().copyWith(day: 0, hour: 0, minute: 0, second: 0)).inDays;

  selectDay(int index) {
    // TODO: FILTER ASSIGNMENTS
    selectedDay = index;
    update();
  }


  /// Back-End
  List<Study>? studies;
  void getStudies() async{
    studies = await StudyRepository().getStudies();
    update();
  }

  void addTask() async{
    if(selectedChild == null){
      AppToast.toast(msg: 'You have to select a child');
      debugPrint('You have to select a child');
      return;
    }

    List<Subject> subject = subjectsTitles.sublist(0, subjectsCount.value).map((e) => Subject(subject: e.text)).toList();
    bool ret = false;
    for (var task in subject) {
      if(task.subject?.isEmpty??true){
        AppToast.toast(msg: 'Subject cannot be empty');
        debugPrint('Task cannot be empty');
        ret = true;
        continue;
      }
    }
    if(ret)return;

    final success = await StudyRepository().addStudy(AddStudyDTO(childId: selectedChild?.id??'', subjects: subject));
    if(success) {
      getStudies();
      clear();
    }
  }

  clear() {
    selectedStudyIndex = 0;
    selectedSubjectIndex = 0;
    subjectsCount.value = 1;
    selectedChild = null;
    for (var e in subjectsTitles) {
      e.clear();
    }
    update();
  }
}