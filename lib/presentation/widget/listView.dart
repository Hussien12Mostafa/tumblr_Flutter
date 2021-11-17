// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/comments.dart';
import 'package:tumbler/presentation/widget/comments.dart';

class ListViewGeneral extends StatelessWidget {
  ListViewGeneral({Key? key}) : super(key: key);

  List<CommentsData> p = toList(postsData[0].m);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: p.length,
      itemBuilder: (Context, index) {
        return Comments(c: p[index]);
      },
    );
  }
}
