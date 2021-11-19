// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class TextFieldPost extends StatelessWidget {
  const TextFieldPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                expands: true,
                autocorrect: true,
                style: TextStyle(fontSize: 25, decoration: TextDecoration.none),
                decoration: InputDecoration(
                  hintText: 'Add something if you like',
                ),
              );
  }
}