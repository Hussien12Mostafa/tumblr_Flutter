// ignore_for_file: file_names, must_be_immutable



import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:like_button/like_button.dart';
import 'package:tumbler/date/datafake/userInfo.dart';

import 'package:tumbler/date/models/notes.dart';
import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';

import 'package:tumbler/logic/functions/like.dart';
import 'package:tumbler/presentation/screens/createPost.dart';
import 'package:tumbler/presentation/screens/homeScreens.dart';
import 'package:tumbler/presentation/widget/notes.dart';

class ButtonsPost extends StatefulWidget {
  ButtonsPost(
      {Key? key,
      required this.post,
      required this.counterReBlog,
      required this.counterLike,
      required this.counterComment,
      required this.notes})
      : super(key: key);
  Post post;
  int counterLike;
  int counterReBlog;
  int counterComment;

  List<Note> notes;
  bool isLike = false;
  @override
  _ButtonsPostState createState() => _ButtonsPostState();
}

class _ButtonsPostState extends State<ButtonsPost> {
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    final bool success = await likeBlogPost(userBlodId.id, widget.post.id);
    int ind = -1;
    for (var i = 0; i < widget.notes.length; i++) {
      if (widget.notes[i].blogId == userBlodId.id &&
          widget.notes[i].noteType == "like") {
        ind = i;
      }
    }
    bool result = likeTest(isLiked);
    if (!result) {
      widget.counterLike++;
      if (ind != -1)
        widget.notes[ind].isDeleted = false;
      else
        widget.notes.add(
            Note(blogId: userBlodId.id, isDeleted: false, noteType: "like"));
    } else {
      if (ind != -1) {
        widget.notes[ind].isDeleted = true;
        widget.counterLike--;
      }
    }

    isLiked = !isLiked;
    print(isLiked);
    setState(() {
      print("coLike=${widget.counterLike}");
    });

    return !isLiked;
  }

  @override
  void initState() {
    for (var i = 0; i < widget.notes.length; i++) {
      if (widget.notes[i].blogId == userBlodId.id &&
          widget.notes[i].noteType == "like") {
        widget.isLike = !widget.notes[i].isDeleted!;
      }
    }
    super.initState();
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
              Navigator.pushNamed(context, Notes.routeName, arguments: [
                widget.counterLike,
                widget.counterReBlog,
                widget.notes,
                widget.post,
                widget.counterComment
              ]);
            },
            child: Text(
              '${widget.counterReBlog + widget.counterLike } notes',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: widget.post.blogId != userBlodId.id
                  ? MediaQuery.of(context).size.width * .29
                  : MediaQuery.of(context).size.width * .07),
          child: FloatingActionButton(
            heroTag: null,
            onPressed: () {
              //shareSheet(context);
            },
            child: Icon(
              Icons.share,
              color: IconTheme.of(context).color,
            ),
          ),
        ),
        FloatingActionButton(
            heroTag: null,
            onPressed: () {
                Navigator.pushNamed(context, Notes.routeName, arguments: [
                widget.counterLike,
                widget.counterReBlog,
                widget.notes,
                widget.post,
                widget.counterComment
              ]);
            },
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
        widget.post.blogId == userBlodId.id
            ? IconButton(
                onPressed: () async {
                String?ll=  await deletePosts(widget.post.id)as String;
                  //still remove in screen
                    Navigator.of(context).pushNamedAndRemoveUntil(
                                    HomeScreen.routeName,
                                    (Route<dynamic> route) => false);
                },
                icon: Icon(Icons.delete))
            : Container(),
        widget.post.blogId == userBlodId.id
            ? IconButton(onPressed: () {
               Navigator.pushNamed(context, CreatePost.routeName, arguments: [
                "edit",
                widget.post
              ]);
              //check when send edit in create post and add html in controller
            }, icon: Icon(Icons.edit))
            : Container()
      ],
    );
  }
}
