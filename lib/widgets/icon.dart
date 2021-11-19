// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  double size;
  IconData icon;
  Function() functionIcon;

  IconWidget(
      {Key? key,
      required this.icon,
      required this.size,
      required this.functionIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: size,
      ),
      onPressed: functionIcon,
    );
  }
}