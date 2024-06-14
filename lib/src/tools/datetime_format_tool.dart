import 'package:intl/intl.dart';

class DatetimeFormatTool {
  static String format(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}