import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showToast(String title, String message,
      [ToastStatus? ts, int? duration]) {
    final ToastColor color = getColorbyStatus(ts);

    Fluttertoast.showToast(
      msg: title != '' ? ("$title\n$message") : message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: (duration ?? 2),
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void showToastError(String title, String message) {
    showToast(title, message, ToastStatus.error, 2);
  }

  static ToastColor getColorbyStatus(ToastStatus? ts) {
    switch (ts) {
      case ToastStatus.success:
        return ToastColor(bgcolor: Colors.green, textcolor: Colors.white);
      case ToastStatus.error:
        return ToastColor(bgcolor: Colors.red, textcolor: Colors.white);
      case ToastStatus.warning:
        return ToastColor(bgcolor: Colors.orange, textcolor: Colors.white);
      case ToastStatus.info:
        return ToastColor(bgcolor: Colors.blue, textcolor: Colors.white);
      default:
        return ToastColor(bgcolor: null, textcolor: Colors.black);
    }
  }
}

enum ToastStatus { success, error, warning, info }

class ToastColor {
  Color? bgcolor;
  Color? textcolor;

  ToastColor({this.bgcolor, this.textcolor});
}
