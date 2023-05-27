import 'package:flutter/material.dart';

class DrawerItemBean {
  final IconData icon;
  final String title;
  final void Function() onTap;

  DrawerItemBean({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
