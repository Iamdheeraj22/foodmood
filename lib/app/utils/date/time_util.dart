import 'package:intl/intl.dart';

class TimeUtil {
  TimeUtil._();

  //time ago since current date time from DateTime
  static String timeAgoSinceDate(String dateString,
      {bool numericDates = true}) {
    final DateTime date = DateTime.parse(dateString);
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  //time ago since current date time from timestamp
  static String getTimeAgoSinceFromTimeStamp(String timestamp,
      {bool numericDates = true}) {
    try {
      final date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
      final date2 = DateTime.now();

      final difference = date2.difference(date);
      if ((difference.inDays / 365).floor() >= 2) {
        return '${(difference.inDays / 365).floor()} years ago';
      } else if ((difference.inDays / 365).floor() >= 1) {
        return (numericDates) ? '1 year ago' : 'Last year';
      } else if ((difference.inDays / 30).floor() >= 2) {
        return '${(difference.inDays / 30).floor()} months ago';
      } else if ((difference.inDays / 30).floor() >= 1) {
        return (numericDates) ? '1 month ago' : 'Last month';
      } else if ((difference.inDays / 7).floor() >= 2) {
        return '${(difference.inDays / 7).floor()} weeks ago';
      } else if ((difference.inDays / 7).floor() >= 1) {
        return (numericDates) ? '1 week ago' : 'Last week';
      } else if (difference.inDays >= 2) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays >= 1) {
        return (numericDates) ? '1 day ago' : 'Yesterday';
      } else if (difference.inHours >= 2) {
        return '${difference.inHours} hours ago';
      } else if (difference.inHours >= 1) {
        return (numericDates) ? '1 hour ago' : 'An hour ago';
      } else if (difference.inMinutes >= 2) {
        return '${difference.inMinutes} minutes ago';
      } else if (difference.inMinutes >= 1) {
        return (numericDates) ? '1 minute ago' : 'A minute ago';
      } else if (difference.inSeconds >= 3) {
        return '${difference.inSeconds} seconds ago';
      } else {
        return 'Just now';
      }
    } catch (E) {
      return '';
    }
  }

  //time ago since current date time from timestamp
/*  static String getTimeAfterDay(DateTime date, {bool numericDates = true}) {
    try {
      */ /*var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));*/ /*

      final difference = dt.DateUtils.dateOnly(DateTime.now()).difference(dt.DateUtils.dateOnly(date));
      if (difference.inDays == 1) {
        return (numericDates) ? '1 day ago' : 'Yesterday';
      } else if (difference.inDays == 0) {
        return TimeFormatUtil.parseDateTime(date, onlyTime: true);
      } else {
        return DateTimeUtil.getSimpleDateTwilio(date);
      }
    } catch (E) {
      return "";
    }
  }*/

  //time ago since current date time from timestamp
  static String getTimeAgoChatTimeStamp(String timestamp,
      {bool numericDates = true}) {
    try {
      final date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
      final date2 = DateTime.now();

      final difference = date2.difference(date);
      if (difference.inHours >= 1) {
        return comparedChatDateTime(date);
      } else if (difference.inMinutes >= 2) {
        return '${difference.inMinutes} minutes ago';
      } else if (difference.inMinutes >= 1) {
        return (numericDates) ? '1 minute ago' : 'A minute ago';
      } else if (difference.inSeconds >= 3) {
        return '${difference.inSeconds} seconds ago';
      } else {
        return 'Just now';
      }
    } catch (E) {
      return '';
    }
  }

  //today yesterday date time format
  static String comparedChatDateTime(DateTime tm) {
    tm = tm.toLocal();
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
    if (difference.compareTo(oneDay) < 1 && tm.isSameDate(today)) {
      return "Today, ${DateFormat('HH:mm').format(tm)}";
    } else if (difference.compareTo(twoDay) < 1) {
      return "Yesterday, ${DateFormat('HH:mm').format(tm)}";
    } else if (difference.compareTo(oneWeek) < 1) {
      switch (tm.weekday) {
        case 1:
          return "Mon, ${DateFormat('HH:mm').format(tm)}";
        case 2:
          return "Tue, ${DateFormat('HH:mm').format(tm)}";
        case 3:
          return "Wed, ${DateFormat('HH:mm').format(tm)}";
        case 4:
          return "Thu, ${DateFormat('HH:mm').format(tm)}";
        case 5:
          return "Fri, ${DateFormat('HH:mm').format(tm)}";
        case 6:
          return "Sat, ${DateFormat('HH:mm').format(tm)}";
        case 7:
          return "Sun, ${DateFormat('HH:mm').format(tm)}";
      }
    } else if (tm.year == today.year) {
      return '${tm.day} $month, ${DateFormat('HH:mm').format(tm)}';
    } else {
      return '${tm.day} $month ${tm.year}';
    }
    return '';
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
