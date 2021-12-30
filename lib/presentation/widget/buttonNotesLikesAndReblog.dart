// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tumbler/date/models/notes.dart';

import 'package:tumbler/date/models/post.dart';

import 'package:tumbler/presentation/screens/postsHome/likesPost.dart';

/// class widget for design likes and reblog buttons
class ButtonsLikesAndReblog extends StatelessWidget {
  ButtonsLikesAndReblog(
      {Key? key,
      required this.notes,
      required this.counterLike,
      required this.counterReBlog})
      : super(key: key);
  List<Note> notes;
  int counterReBlog;
  int counterLike;

  /// post variable for design

  /// function widget to design buttons
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await Navigator.of(context)
            .pushNamed(LikesPost.routeName, arguments: [notes,counterLike,counterReBlog]);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${counterLike} likes',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          Text(
            '${counterReBlog} reblog',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
