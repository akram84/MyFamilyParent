import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_family/data/dto/account/update_profile.dart';
import 'package:my_family/data/model/user.dart';
import 'package:my_family/data/repository/user_repository.dart';
import 'package:my_family/data/utils/api_service.dart';

import '../../../ui/helper/app_toast.dart';
import '../../utils/api_path.dart';

class UpdateProfileRepo{
  static Future<bool> updateProfile(UpdateProfileDTO updateProfileDTO) async{
    try {
      final response = await ApiService.putApi(ApiPaths.updateProfile, body: await updateProfileDTO.toJson());
      if(updateProfileDTO.image != null) await ApiService.postFormData('image', body: {'image': await MultipartFile.fromFile(updateProfileDTO.image!, filename: updateProfileDTO.image!.split('/').last)});
      if(response.statusCode! < 300 && response.data['success']){
        AppToast.toast(msg: response.data['message']??'Profile updated successfully');

        User user = User.fromJson(response.data['record']);
        await UserRepository.saveUser(user);
        return true;
      } else {
        AppToast.toast(msg: 'Couldn\'t Update profile');
      }
      return false;
    } on Exception catch (e) {
      debugPrint(e.toString());
      AppToast.toast(msg: 'Couldn\'t Update profile');
      return false;
    }
  }
}