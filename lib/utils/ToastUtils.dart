import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToast(String content,
      {Toast length = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.BOTTOM,
      Color backColor = Colors.black54,
      Color textColor = Colors.white}) {
    if (content != null) {
      Fluttertoast.showToast(
          msg: content,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: backColor,
          textColor: textColor,
          fontSize: 16.0);
    }
  }
}
