 import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast{
  MyToast(message, {double? fontSize, Color? fontColor, Color? background, String? webBgColor}) {
    Fluttertoast.showToast(
        webBgColor: webBgColor,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 15,
        msg: message.toString(),
        fontSize: fontSize ?? 17,
        textColor: Colors.white,
      );
  }
}