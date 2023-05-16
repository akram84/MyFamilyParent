import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

import '../../../ui/helper/app_toast.dart';
import '../../dto/home/add_event.dart';
import '../../model/calendar/event.dart';
import '../../utils/api_path.dart';
import '../../utils/api_service.dart';

class CalendarRepo {
  static Future<Map<DateTime, List<Event>>?> getEvents() async {
    try {
      final response = await ApiService.getApi(ApiPaths.getEvents);
      Logger.w(response.data);
      if (response.statusCode == 200) {
        final Map<DateTime, List<Event>> events = (response.data as Map).map((key, value) {
          final day = DateTime.parse(key); // parse key to date
          final events = (value as List?)?.map((event) => Event.fromJson(event)).toList()??[]; // parse json events
          return MapEntry(day, events); // return every date with its list of events
        });
        return events;
      } else {
        AppToast.toast(msg: 'Events retrieving failed');
      }
    } on Exception catch (e) {
      print('ERROR: $e');
      AppToast.toast(msg: 'Events retrieving failed');
    }
    return null;
  }

  Future<bool> addEvent(AddEventDTO addEventDTO) async{
    try {
      final response = await ApiService.postApi(ApiPaths.addEvent, body: addEventDTO.toJson());
      if(response.statusCode == 201){
        AppToast.toast(msg: response.data['message']??'Event added successfully');
      } else {
        AppToast.toast(msg: 'Couldn\'t add Event');
      }
      return response.data['success'];
    } on Exception catch (e) {
      debugPrint(e.toString());
      AppToast.toast(msg: 'Couldn\'t add Event');
      return false;
    }
  }
}

