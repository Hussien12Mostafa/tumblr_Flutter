// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:like_button/like_button.dart';
import 'package:tumbler/date/datafake/userInfo.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/presentation/widget/notes.dart';
import 'package:tumbler/presentation/widget/share.dart';

class ButtonsPost extends StatefulWidget {
  ButtonsPost({Key? key, required this.post}) : super(key: key);
  Post post;
  bool isLike = false;
  @override
  _ButtonsPostState createState() => _ButtonsPostState();
}

class _ButtonsPostState extends State<ButtonsPost> {
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();
    if (!isLiked) {
      widget.post.numOfLikes = widget.post.numOfLikes + 1;
       widget.post.likesThisPost.addAll({currentUser: 'like'});
    }
   else{
     widget.post.numOfLikes = widget.post.numOfLikes -1;
     widget.post.likesThisPost.remove(currentUser);
   }
    isLiked = !isLiked;
    setState(() {});

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * .03),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.pushNamed(context, Notes.routeName,
                  arguments: widget.post);
            },
            child: Text(
              '${widget.post.numOfLikes + widget.post.numOfReblog} notes',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * .29),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              shareSheet(context);
            },
            child: Icon(
              Icons.share,
              color: IconTheme.of(context).color,
            ),
          ),
        ),
        FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            child: Icon(
              Icons.chat,
              color: IconTheme.of(context).color,
            )),
        FloatingActionButton(
          heroTag: null,
          onPressed: () {},
          child: Icon(
            Icons.ac_unit_sharp,
            color: IconTheme.of(context).color,
          ),
        ),
        LikeButton(
          isLiked: widget.isLike,
          onTap: onLikeButtonTapped,
          likeBuilder: (bool isLiked) {
            widget.isLike = !widget.isLike;

            return Icon(
              FontAwesome5.heart,
              color: isLiked ? Colors.red : Colors.grey,
            );
          },
        ),
      ],
    );
  }
}
