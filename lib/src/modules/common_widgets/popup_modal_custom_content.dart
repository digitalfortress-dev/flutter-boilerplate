import 'package:flutter/material.dart';

class PopupModelCustomContent {
  static const double padding = 20;
  static const double defaultMaxWidth = 512;
  final double? maxWidth;

  PopupModelCustomContent({this.maxWidth = defaultMaxWidth});

  static Future<dynamic> showModal(
      {required BuildContext ownerCtx,
      Widget? content,
      double maxWidth = defaultMaxWidth,
      Color? closeIconColor}) {
    return showDialog(
        context: ownerCtx,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(padding),
              ),
              elevation: 0,
              backgroundColor: Colors.black54,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Stack(
                        children: [
                          content!,
                          Positioned(
                            right: 4,
                            top: 4,
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text('Close'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
    // ! [MASTER] THis cause error when close dialog
    // .then((value) =>
    // {print('RETURN VALUE : $value'), Navigator.pop(ownerCtx, true)});
  }
}
