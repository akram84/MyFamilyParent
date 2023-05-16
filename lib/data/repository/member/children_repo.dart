import 'dart:convert';

import 'package:my_family/data/utils/api_path.dart';
import 'package:my_family/data/utils/api_service.dart';

import '../../model/children/child.dart';
import '../../utils/app_local_storage.dart';

class ChildrenRepo{
  static Future<void> getChildren() async{
    try {
      final response = await ApiService.getApi(ApiPaths.getChildren);
      if(response.statusCode == 200){
        _saveChildren(response.data['children'] as List?);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  static const String _childrenKey = 'children';
  static Future<void> _saveChildren(List? children) async => await AppLocalStorage.saveData(key: _childrenKey, value: jsonEncode(children));

  static List<Child> get children {
    List response = jsonDecode(AppLocalStorage.getData(key: _childrenKey)??'[]');
    return response.map((child) => Child.fromJson(child)).toList();
  }
}