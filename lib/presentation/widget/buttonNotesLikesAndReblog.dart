// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import 'package:tumbler/date/models/post.dart';

import 'package:tumbler/presentation/screens/postsHome/likesPost.dart';

/// class widget for design likes and reblog buttons
class ButtonsLikesAndReblog extends StatelessWidget {
  ButtonsLikesAndReblog({Key? key, required this.p}) : super(key: key);

  /// post variable for design
  Post p;

  /// function widget to design buttons
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await Navigator.of(context)
            .pushNamed(LikesPost.routeName, arguments: p);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${p.numOfLikes} likes',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          Text(
            '${p.numOfReblog} reblog',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
