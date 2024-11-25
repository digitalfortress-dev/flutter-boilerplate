import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingPopup {
  static BuildContext? _context;
  static void hide() {
    if (_context != null) {
      Navigator.of(_context!).pop();
      ChangeStatusBarHandler.execute(_context!);
      _context = null;
    } else {
      //do nothing
    }
  }

  static void show(BuildContext context) {
    if (_context == null) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          LoadingPopup._context = context;
          return const Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                //color: Colors.white,
              ),
            ),
          );
        },
      );
    } else {
      //do nothing
    }
  }
}

class ChangeStatusBarHandler {
  static void execute(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Color for Android
      statusBarBrightness: Theme.of(context).platform == TargetPlatform.iOS
          ? Brightness.light
          : Brightness.dark,
    ));
  }
}
