import 'package:flutter/cupertino.dart';
import 'package:my_family/core/utils/app_logger.dart';
import 'package:my_family/data/dto/account/add_member.dart';

import '../../../ui/helper/app_toast.dart';
import '../../utils/api_path.dart';
import '../../utils/api_service.dart';

class AddMemberRepo{
  static Future<bool> addMember(AddMemberDTO addMemberDTO) async{
    try {
      final response = await ApiService.postApi(ApiPaths.addMember, body: addMemberDTO.toJson());
      AppLogger.warning(addMemberDTO.toJson());
      AppLogger.warning(ApiPaths.addMember);
      if(response.statusCode == 201){
        AppToast.toast(msg: response.data['message']??'Member added successfully');
      } else {
        AppToast.toast(msg: 'Couldn\'t add members');
      }
      return response.data['success'];
    } on Exception catch (e) {
      debugPrint(e.toString());
      AppToast.toast(msg: 'Couldn\'t add members');
      return false;
    }
  }
}