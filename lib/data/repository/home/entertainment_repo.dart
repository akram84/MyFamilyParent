import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_family/ui/helper/app_toast.dart';
import 'package:my_family/ui/helper/index.dart';

import '../../dto/home/add_entertainment.dart';
import '../../model/entertainment/entertainment.dart';
import '../../utils/api_path.dart';
import '../../utils/api_service.dart';

class EntertainmentRepository{

  Future<List<Entertainment>> getEntertainments() async{
    try {
      final response = await ApiService.getApi(ApiPaths.getEntertainments);
      Logger.w(response.data);
      if(response.statusCode == 200){
        final List<Entertainment> entertainments = (response.data['record'] as List?)?.map((e) => Entertainment.fromJson(e)).toList()??[];
        AppToast.toast(msg: 'Entertainments retrieved');
        return entertainments;
      } else {
        AppToast.toast(msg: 'Entertainments retrieving failed');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      AppToast.toast(msg: 'Entertainments retrieving failed');
    }
    return [];
  }

  Future<bool> addEntertainment(AddEntertainmentDTO addEntertainmentDTO) async{
    Logger.w(addEntertainmentDTO.toJson());
    try {
      final response = await ApiService.postApi(ApiPaths.addEntertainment, body: addEntertainmentDTO.toJson());
      if(response.statusCode! < 300){
        AppToast.toast(msg: response.data['message']??'Entertainment Added successfully');
      } else {
        AppToast.toast(msg: response.data is Map ? response.data['message']??'Couldn\'t add Entertainment' : 'Couldn\'t add Entertainment');
      }
      return response.data['success'];
    } on Exception catch (e) {
      debugPrint(e.toString());
      Logger.e(e);
      AppToast.toast(msg: 'Couldn\'t add Entertainment');
      return false;
    }
  }

  Future vote(BuildContext context, title, suggestion) async{
    try {
      pop(context);
      final response = await ApiService.postApi(ApiPaths.vote, body: {'title': title, 'suggestion': suggestion});
      return response.statusCode == 201 && response.data['success'];
    } on Exception catch (e) {
      Logger.e(e);
      AppToast.toast(msg: 'Couldn\'t Vote');
      return false;
    }
  }
}