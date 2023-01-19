import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatDateTime(
      {required String dateString, String format = 'dd-MMM-yyyy HH:MM:SS AA'}) {
    final DateTime? date = DateTime.tryParse(dateString);
    if (date != null) {
      return DateFormat(format).format(date);
    } else {
      return dateString;
    }
  }

  static String formatTime(TimeOfDay time, BuildContext context) {
    return DateFormat('HH:mm:ss')
        .format(DateFormat.jm().parse(time.format(context)));
  }
}
