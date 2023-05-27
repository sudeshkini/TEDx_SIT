import 'package:flutter/material.dart';

class MyNavigation {
  void push(
      {required BuildContext context,
      required String screen,
      required Map arguments}) {
    Navigator.pushNamed(context, screen, arguments: arguments);
  }

  void pushReplacement(
      {required BuildContext context,
      required String screen,
      required Map arguments}) {
    Navigator.pushReplacementNamed(context, screen, arguments: arguments);
  }

  void pop({required BuildContext context, required Map arguments}) {
    Navigator.pop(context);
  }
}
