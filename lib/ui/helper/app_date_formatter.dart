import 'package:intl/intl.dart';

class AppDateFormatter{

  static const String fullDateFormat = 'yMMMd';
  static String getFullDate({required String? date, String format = fullDateFormat}){
    final DateTime finalDate = DateTime.parse(date??DateTime.now().toString());
    return DateFormat(format).format(finalDate);
  }
}
