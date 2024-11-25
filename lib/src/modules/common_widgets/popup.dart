import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/core/utils/app_size.dart';

enum PopupType {
  suggestAccept,
  suggestCancel,
  justOk,
  sharing,
}

class Popup {
  static bool _isShowing = false;
  static bool get isShowing {
    return _isShowing;
  }

  static void hide(BuildContext? context) {
    _isShowing = false;
    Navigator.pop(context!);
  }

  static void show({
    required BuildContext? context,
    String? titleActionOk,
    String? titleActionCancel,
    String? title,
    String? desciption,
    PopupType? type = PopupType.suggestAccept,
    Function? onDone,
  }) {
    if (_isShowing) {
      hide(context);
    }
    _isShowing = true;
    double width = AppSize.width;
    double padding = width < 414 ? 60 : 100;
    Widget buttonOption;
    switch (type) {
      case PopupType.suggestAccept:
        buttonOption = _ButtonOption(
          titleActionOk: titleActionOk,
          titleActionCancel: titleActionCancel,
          padding: padding,
          onDone: onDone,
        );
        break;
      case PopupType.justOk:
        buttonOption = _ButtonOK(
          onDone: onDone,
        );
        break;
      case PopupType.suggestCancel:
        buttonOption = _ButtonOK(
          onDone: onDone,
        );
        break;
      default:
        buttonOption = const SizedBox();
    }
    showDialog(
      context: context!,
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 414),
                width: width - padding,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    _TitleRequest(title: title),
                    _DesciptionRequest(desciption: desciption),
                    buttonOption,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonOption extends StatelessWidget {
  final Function? onDone;
  final String? titleActionOk;
  final String? titleActionCancel;
  const _ButtonOption({
    super.key,
    @required this.padding,
    this.onDone,
    this.titleActionOk,
    this.titleActionCancel,
  });

  final double? padding;

  void _onDone(bool isAccpet) {
    var callBack = onDone;
    if (callBack != null) {
      callBack(isAccpet);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = AppSize.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 15),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Container(
            width: (width - padding! - 45) / 2,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3),
            ),
            child: TextButton(
              onPressed: () {
                Popup.hide(context);
                _onDone(false);
              },
              child: Text(
                titleActionCancel == null ? "Hủy" : titleActionCancel!,
                style: TextStyle(
                    color: Colors.black.withAlpha(150),
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            width: (width - padding! - 45) / 2,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(3),
            ),
            child: TextButton(
              onPressed: () {
                Popup.hide(context);
                _onDone(true);
              },
              child: Text(
                titleActionOk == null ? "Đồng ý" : titleActionOk!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DesciptionRequest extends StatelessWidget {
  const _DesciptionRequest({
    super.key,
    @required this.desciption,
  });

  final String? desciption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      child: Text(
        desciption!,
        style: const TextStyle(fontSize: 15, height: 1.3, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _TitleRequest extends StatelessWidget {
  const _TitleRequest({
    super.key,
    @required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Text(
        title!,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _ButtonOK extends StatelessWidget {
  final Function? onDone;

  const _ButtonOK({
    super.key,
    this.onDone,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Colors.black,
      ),
      margin: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
      child: SizedBox.expand(
        child: MaterialButton(
          child: const Text("Okay",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
          onPressed: () {
            Popup.hide(context);
            var callBack = onDone;
            if (callBack != null) {
              callBack(true);
            }
          },
        ),
      ),
    );
  }
}
