import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
          child: Theme.of(context).platform == TargetPlatform.iOS
              ? Theme(
                  data: ThemeData(
                      cupertinoOverrideTheme: const CupertinoThemeData(
                          brightness: Brightness.dark)),
                  child: const CupertinoActivityIndicator(
                    radius: 13,
                  ))
              : const CircularProgressIndicator(
                  color: Colors.white,
                )),
    );
  }
}
