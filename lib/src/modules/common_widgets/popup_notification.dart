import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupNotification {
  static void show({bool? isSuccess, String? message, BuildContext? context}) {
    Fluttertoast.showToast(
        msg: message ?? '',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black.withOpacity(0.7),
        textColor: Colors.white,
        webBgColor: 'linear-gradient(to right, #000000, #000000)',
        fontSize: 16.0);
  }
}
