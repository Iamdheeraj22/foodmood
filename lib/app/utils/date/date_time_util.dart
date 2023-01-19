

import 'package:intl/intl.dart';

class DateTimeUtil {
  DateTimeUtil._();

  //format datetime in '2021-01-15 16:20'
  static String formatDateTime(DateTime dateTime) {
    final formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    return formattedDate;
  }

//format datetime in '2021-01-15 16:20'
  static String formatCurrentDateTime() {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    return formattedDate;
  }

//getDate from timestamp in '15 01 2021' date format
  static String getDateFromTimeStamp(String timestamp) {
    try {
      final dateTime =
          DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
      final day = dateTime.day;
      final month = getMonthFromMonthNumber(dateTime.month);
      final year = dateTime.year;
      return '$day $month $year';
    } catch (E) {
      return '';
    }
  }

//getDateTime in 'January 15 ,2021 at 2:20 PM' format
  static String getDateTimeInMonthDayFormat(String dateTime) {
    String getTime(DateTime dateTime) {
      return "${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? "PM" : "AM"}";
    }

    final DateTime dateT = DateTime.parse(dateTime);
    return '${getMonthFromMonthNumber(dateT.month)} ${dateT.day} , ${dateT.year} at ${getTime(dateT)}';
  }

//get month name from month number
  static String getMonthFromMonthNumber(int month) {
    switch (month) {
      case 1:
        return 'January';

      case 2:
        return 'February';

      case 3:
        return 'March';

      case 4:
        return 'April';

      case 5:
        return 'May';

      case 6:
        return 'June';

      case 7:
        return 'July';

      case 8:
        return 'August';

      case 9:
        return 'September';

      case 10:
        return 'October';

      case 11:
        return 'November';

      case 12:
        return 'December';

      default:
        return 'January';
    }
  }

//getDateTime in 'Today, Yesterday at 14:20' dateTime format
  static String comparedDateTime(DateTime tm) {
    tm = tm.toLocal();
    final DateTime today = DateTime.now();
    const Duration oneDay = Duration(days: 1);
    const Duration twoDay = Duration(days: 2);
    const Duration oneWeek = Duration(days: 7);
    String? month;
    switch (tm.month) {
      case 1:
        month = 'January';
        break;
      case 2:
        month = 'February';
        break;
      case 3:
        month = 'March';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'june';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'August';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'October';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'December';
        break;
    }

    final Duration difference = today.difference(tm);

    if (difference.compareTo(oneDay) < 1) {
      return "Today at ${DateFormat('HH:mm').format(tm)}";
    } else if (difference.compareTo(twoDay) < 1) {
      return "Yesterday at ${DateFormat('HH:mm').format(tm)}";
    } else if (difference.compareTo(oneWeek) < 1) {
      switch (tm.weekday) {
        case 1:
          return "Monday at ${DateFormat('HH:mm').format(tm)}";
        case 2:
          return "Tuesday at ${DateFormat('HH:mm').format(tm)}";
        case 3:
          return "Wednesday at ${DateFormat('HH:mm').format(tm)}";
        case 4:
          return "Thursday at ${DateFormat('HH:mm').format(tm)}";
        case 5:
          return "Friday at ${DateFormat('HH:mm').format(tm)}";
        case 6:
          return "Saturday at ${DateFormat('HH:mm').format(tm)}";
        case 7:
          return "Sunday at ${DateFormat('HH:mm').format(tm)}";
      }
    } else if (tm.year == today.year) {
      return '${tm.day} $month';
    }

    return '${tm.day} $month ${tm.year}';
  }

//getDate in 'Sunday 15th January 2021' date format
  static String getDateInDayMonthFormat(DateTime tm) {
    tm = tm.toLocal();
    String? month;
    String? day;
    String? weekDay;
    final String year = tm.year.toString();

    switch (tm.day) {
      case 1:
        day = '1st';
        break;
      case 2:
        day = '2nd';
        break;
      case 3:
        day = '3rd';
        break;
      case 4:
        day = '4th';
        break;
      default:
        day = '${tm.day}th';
        break;
    }

    switch (tm.month) {
      case 1:
        month = 'January';
        break;
      case 2:
        month = 'February';
        break;
      case 3:
        month = 'March';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'june';
        break;
      case 7:
        month = 'July';
        break;
      case 8:
        month = 'August';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'October';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'December';
        break;
    }

    switch (tm.weekday) {
      case 1:
        weekDay = 'Monday';
        break;
      case 2:
        weekDay = 'Tuesday';
        break;
      case 3:
        weekDay = 'Wednesday';
        break;
      case 4:
        weekDay = 'Thursday';
        break;
      case 5:
        weekDay = 'Friday';
        break;
      case 6:
        weekDay = 'Saturday';
        break;
      case 7:
        weekDay = 'Sunday';
        break;
    }

    return '$weekDay $day $month $year';
  }

//getDate in 'Sun 15th Jan 2021' date format
  static String getDateInShortDayMonthFormat(DateTime tm) {
    tm = tm.toLocal();
    String? month;
    String? day;
    String? weekDay;
    final String year = tm.year.toString();

    switch (tm.day) {
      case 1:
        day = '1st';
        break;
      case 2:
        day = '2nd';
        break;
      case 3:
        day = '3rd';
        break;
      case 4:
        day = '4th';
        break;
      default:
        day = '${tm.day}th';
        break;
    }

    switch (tm.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      case 12:
        month = 'Dec';
        break;
    }

    switch (tm.weekday) {
      case 1:
        weekDay = 'Mon';
        break;
      case 2:
        weekDay = 'Tue';
        break;
      case 3:
        weekDay = 'Wed';
        break;
      case 4:
        weekDay = 'Thu';
        break;
      case 5:
        weekDay = 'Fri';
        break;
      case 6:
        weekDay = 'Sat';
        break;
      case 7:
        weekDay = 'Sun';
        break;
    }

    return '$weekDay $day $month $year';
  }

//getDate in '15-Jan-2021' date format
  static String getDateShortMonthYearFormat(String tm) {
    DateTime dateTime = DateTime.parse(tm);
    dateTime = dateTime.toLocal();
    final formattedDate = DateFormat('dd-MMM-yyyy').format(dateTime);
    return formattedDate;
  }

  //today yesterday date time format
  static String? comparedChatDateTime(String timestamp) {
    final tm =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp)).toLocal();
    final DateTime today = DateTime.now();
    const Duration oneDay = Duration(days: 1);
    const Duration twoDay = Duration(days: 2);
    const Duration oneWeek = Duration(days: 7);
    String? month;
    switch (tm.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      case 12:
        month = 'Dec';
        break;
    }

    final Duration difference = today.difference(tm);

    if (difference.compareTo(oneDay) < 1) {
      return "Today, ${DateFormat('hh:mm a').format(tm)}";
    } else if (difference.compareTo(twoDay) < 1) {
      return "Yesterday, ${DateFormat('hh:mm a').format(tm)}";
    } else if (difference.compareTo(oneWeek) < 1) {
      switch (tm.weekday) {
        case 1:
          return "Mon, ${DateFormat('hh:mm a').format(tm)}";
        case 2:
          return "Tue, ${DateFormat('hh:mm a').format(tm)}";
        case 3:
          return "Wed, ${DateFormat('hh:mm a').format(tm)}";
        case 4:
          return "Thu, ${DateFormat('hh:mm a').format(tm)}";
        case 5:
          return "Fri, ${DateFormat('hh:mm a').format(tm)}";
        case 6:
          return "Sat, ${DateFormat('hh:mm a').format(tm)}";
        case 7:
          return "Sun, ${DateFormat('hh:mm a').format(tm)}";
      }
    } else if (tm.year == today.year) {
      return '${tm.day} $month';
    } else {
      return '${tm.day} $month ${tm.year}';
    }
    return null;
  }

//getDateTime in '2012-07-10 14:58:00' date time format
  static String getDateTime(String tm) {
    final DateTime dateTime = DateTime.parse(tm);
    final formattedDate = DateFormat('yyyy-MM-dd  HH:mm:ss').format(dateTime);
    return formattedDate;
  }

//getDate in '12-01-2021' format
  static String getSimpleDate(String tm) {
    final DateTime dateTime = DateTime.parse(tm);
    final formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }

//getDate in '12-Jan-2021' format
  static String getSimpleDateWithMonthName(String tm) {
    final DateTime dateTime = DateTime.parse(tm);
    final formattedDate = DateFormat('dd-MMM-yyyy').format(dateTime);
    return formattedDate;
  }

//getDate in '12-01-2021' format
  static String getSimpleDateTwilio(DateTime dateTime) {
    final formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }

//getYear From date
  static String getYearFromDate(String tm) {
    final DateTime dateTime = DateTime.parse(tm);
    return dateTime.year.toString();
  }

//getDate in '2012-07-10' date format current DateTime
  static String formatCurrentDate() {
    final DateTime currentDate = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    return formattedDate;
  }

//check, is date in future or not
  static bool isFutureDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateTime dateTimeNow = DateTime.now();
    return dateTime.isAfter(dateTimeNow);
  }

//check, is date in past or not
  static bool isPastDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateTime dateTimeNow = DateTime.now();
    return dateTime.isBefore(dateTimeNow);
  }

//get current year
  static int getCurrentYear() {
    final DateTime dateTimeNow = DateTime.now();
    return dateTimeNow.year;
  }

//get dateTime in timestamp
  static int gameWeekEndDateTime(String date) {
    DateTime dateTime = DateTime.parse(date);
    dateTime = dateTime.toLocal();
    return dateTime.millisecondsSinceEpoch + 1000 * 60;
  }

//getDateTime in 'Mon, 14:20' format
  static String getDayShortAndTime(String date) {
    DateTime dateTime = DateTime.parse(date);
    dateTime = dateTime.toLocal();
    switch (dateTime.weekday) {
      case 1:
        return "Mon, ${DateFormat('HH:mm').format(dateTime)}";
      case 2:
        return "Tue, ${DateFormat('HH:mm').format(dateTime)}";
      case 3:
        return "Wed, ${DateFormat('HH:mm').format(dateTime)}";
      case 4:
        return "Thu,${DateFormat('HH:mm').format(dateTime)}";
      case 5:
        return "Fri, ${DateFormat('HH:mm').format(dateTime)}";
      case 6:
        return "Sat, ${DateFormat('HH:mm').format(dateTime)}";
      case 7:
        return "Sun, ${DateFormat('HH:mm').format(dateTime)}";
    }
    return '';
  }

//check Current Time is After Saturday 6PM
  static bool isCurrentTimeAfterSaturday6PM() {
    DateTime tm = DateTime.now();
    tm = tm.toLocal();
    if (tm.weekday == 6 && tm.hour >= 18) {
      return true;
    }
    return false;
  }
}
