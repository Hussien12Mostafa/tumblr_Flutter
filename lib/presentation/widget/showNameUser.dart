// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class ShowNameUser extends StatelessWidget {
  ShowNameUser({Key? key, required this.name}) : super(key: key);
  String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
