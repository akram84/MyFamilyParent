import 'dart:convert';

import 'package:flutter_easylogger/flutter_logger.dart';

class AppLogger {

  static String jsonToString(dynamic json) {
    return const JsonEncoder.withIndent('  ').convert(json);
  }

  static void logApi(
      {String? apiType,
      String? path,
      Map<String?, dynamic>? body,
      dynamic response}) {
    return Logger.d('$apiType Path :$path \n Body:${AppLogger.jsonToString(body)} \n Response: ${AppLogger.jsonToString(response)} ');
  }

  static void verbose(dynamic message) {
    Logger.v(message);
  }

  void debug(dynamic message) {
    Logger.d(message);
  }

  static void info(dynamic message) {
    Logger.i(message);
  }

  static void warning(dynamic message) {
    Logger.w(message);
  }

  static void error(dynamic e, {StackTrace? stackTrace}) {
    Logger.e(
      'Error :${e.toString()}  \n trace :${stackTrace.toString()}',
    );
  }

  static void fatalError(dynamic message) {
    // Logger.wtf(message);
  }

  void bigprint(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

}
