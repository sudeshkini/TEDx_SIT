import 'package:flutter/cupertino.dart';

class SocialMediaIconBean {
  final IconData icon;
  final void Function() onTap;

  SocialMediaIconBean({
    required this.icon,
    required this.onTap,
  });
}
