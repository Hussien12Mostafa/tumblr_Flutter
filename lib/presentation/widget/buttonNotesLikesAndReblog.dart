// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import 'package:tumbler/date/models/post.dart';

import 'package:tumbler/presentation/screens/postsHome/likesPost.dart';

/// class widget for design likes and reblog buttons
class ButtonsLikesAndReblog extends StatelessWidget {
  ButtonsLikesAndReblog({Key? key, required this.commentsPost,required this.counts,required this.likesUsers,required this.reBlogPost}) : super(key: key);
    List<String> likesUsers;
    List<Map<String, dynamic>> commentsPost ;
    List<Map<String, dynamic>> reBlogPost ;
    List<int> counts ;
  /// post variable for design
  

  /// function widget to design buttons
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await Navigator.of(context)
            .pushNamed(LikesPost.routeName, arguments: [likesUsers,commentsPost,reBlogPost,counts]);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${counts[0]} likes',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          Text(
            '${counts[1]} reblog',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
