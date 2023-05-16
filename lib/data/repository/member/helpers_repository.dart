import 'dart:convert';

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_family/data/model/helper/helper.dart';
import 'package:my_family/data/utils/api_path.dart';
import 'package:my_family/data/utils/api_service.dart';
import 'package:my_family/data/utils/app_local_storage.dart';

class HelpersRepo{
  static Future<List<Helper>> getHelpers() async{
    try {
      final response = await ApiService.getApi(ApiPaths.getHelpers);
      if(response.statusCode == 200){
        _saveHelpers(response.data['helpers'] as List?);
        Logger.e(response);
      }
    } on Exception catch (e) {
      print(e);
    }
    return [];
  }

  static const String _helpersKey = 'helpers';
  static Future<void> _saveHelpers(List? helpers) async => await AppLocalStorage.saveData(key: _helpersKey, value: jsonEncode(helpers));

  static List<Helper> get helpers {
    List response = jsonDecode(AppLocalStorage.getData(key: _helpersKey)??'[]');
    return response.map((child) => Helper.fromJson(child)).toList();
  }
}