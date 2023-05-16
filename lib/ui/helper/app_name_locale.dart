
import 'package:my_family/core/constants.dart';

import '../../data/repository/language_repository.dart';

class AppName{
  String? arName;
  String? enName;

  AppName({this.arName, this.enName,});

  static String translate({arName, enName}){
    if(LanguageRepository.getLang == Const.KEY_LANGUAGE_EN){
      return enName??'No Name Found';
    }
    return arName??'No Name Found';
  }
}