import 'package:flutter/material.dart';

class StaticService {

  static showDialogBox(
      {required BuildContext context,
        required Widget child,
        bool canDismiss = false}) async {
    return await showDialog(
        barrierDismissible: canDismiss,
        context: context,
        builder: (BuildContext context) {
          return child;
        });
  }

  static Future<Object?> pushPage(
      {required BuildContext context, required Widget route}) async {
    return await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => route));
  }

  static pushReplacement(
      {required BuildContext context, required Widget route}) async {
    await Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => route));
  }
}