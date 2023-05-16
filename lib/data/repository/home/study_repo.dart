import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_family/data/dto/home/add_study.dart';
import 'package:my_family/data/model/study/studies.dart';
import 'package:my_family/ui/helper/app_toast.dart';

import '../../model/study/study.dart';
import '../../utils/api_path.dart';
import '../../utils/api_service.dart';

class StudyRepository{
  Future<List<Study>> getStudies() async{
    try {
      final response = await ApiService.getApi(ApiPaths.getStudies);
      Logger.w(response.data);
      if(response.statusCode == 200){
        final List<Study> studies = Studies.fromJson(response.data).study??[];
        AppToast.toast(msg: 'Studies retrieved');
        return studies;
      } else {
        AppToast.toast(msg: 'Studies retrieving failed');
      }
    } on Exception catch (e) {
      print('ERROR: $e');
      AppToast.toast(msg: 'Studies retrieving failed');
    }
    return [];
  }

  Future<bool> addStudy(AddStudyDTO addStudyDTO) async{
    try {
      final response = await ApiService.postApi(ApiPaths.addStudy, body: addStudyDTO.toJson());
      if(response.statusCode == 200){
        AppToast.toast(msg: response.data['message']??'Study Added Successfully');

      } else {
        AppToast.toast(msg: 'Couldn\'t add study');
      }
      return response.data['success'];
    } on Exception catch (e) {
      print('ERROR: $e');
      AppToast.toast(msg: 'Studies retrieving failed');
      return false;
    }
  }
}