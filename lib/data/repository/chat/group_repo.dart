import 'package:flutter_easylogger/flutter_logger.dart';

import '../../../ui/helper/app_toast.dart';
import '../../dto/home/add_group.dart';
import '../../model/chat/group.dart';
import '../../utils/api_path.dart';
import '../../utils/api_service.dart';

class GroupRepo{
  Future<List<Group>> getGroups() async{
    try {
      final response = await ApiService.getApi(ApiPaths.getGroups);
      Logger.w(response.data);
      if(response.statusCode == 200){
        final List<Group> groups = (response.data['groups'] as List?)?.map((group) => Group.fromJson(group)).toList()??[];
        AppToast.toast(msg: 'Groups retrieved');
        return groups;
      } else {
        AppToast.toast(msg: 'Groups retrieving failed');
      }
    } on Exception catch (e) {
      print('ERROR: $e');
      AppToast.toast(msg: 'Groups retrieving failed');
    }
    return [];
  }

  Future<bool> createGroup(CreateGroupDTO createGroupDTO) async{
    try {
      final response = await ApiService.postApi(ApiPaths.createGroup, body: createGroupDTO.toJson());
      Logger.w(createGroupDTO.toJson());
      Logger.w(response);
      if(response.statusCode == 201){
        AppToast.toast(msg: response.data['message']??'Group Added Successfully');
      } else {
        AppToast.toast(msg: 'Couldn\'t create group');
      }
      return response.data['success'];
    } on Exception catch (e) {
      print('ERROR: $e');
      AppToast.toast(msg: 'Couldn\'t create group');
      return false;
    }
  }

}