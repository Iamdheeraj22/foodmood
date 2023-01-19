import 'dart:developer';

import 'package:flutter/foundation.dart';

class DebugUtils {
  
  DebugUtils.showPrint(String value, {String? prefix}) {
    if (kDebugMode) {
      print("${prefix ?? "Debug_Print"} >> $value");
    }
  }

  DebugUtils.showLog(String value, {String? prefix, error}) {
    if (kDebugMode) {
      log("${prefix ?? "Debug_Print"} >> $value", error: error);
    }
  }
}
