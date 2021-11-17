// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/comments.dart';

class Comments extends StatelessWidget {
  Comments({Key? key, required this.c}) : super(key: key);
  CommentsData c;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.height * .03,
          backgroundImage: NetworkImage(c.s.imageUrl),
        ),
        Text(
          c.comment,
        ),
      ],
    );
  }
}
