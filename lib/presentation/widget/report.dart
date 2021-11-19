// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';


reportSheet(BuildContext context) {
  showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      context: context,
      builder: (context) {
        return TextButton(
            onPressed: () {},
            child: Text(
              'Report',
              style: Theme.of(context).textTheme.headline2,
            ));
      });
}
