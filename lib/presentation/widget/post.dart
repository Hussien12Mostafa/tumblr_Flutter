// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_cast, avoid_print, avoid_init_to_null, unrelated_type_equality_checks, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tumbler/date/models/blog.dart';
import 'package:tumbler/date/models/notes.dart';

import 'package:tumbler/date/models/post.dart';
import 'package:tumbler/logic/apiBackEnd/functionsAPI.dart';
import 'package:tumbler/presentation/screens/profile.dart';
import 'package:tumbler/presentation/screens/profileUser.dart';

import 'package:tumbler/presentation/widget/networkImage.dart';

import 'package:tumbler/presentation/widget/report.dart';
import 'package:tumbler/presentation/widget/rowButtonsPost.dart';

import 'package:tumbler/presentation/widget/showNameUser.dart';

class ShowPost extends StatefulWidget {
  Post post;

  bool isLike = false;
  ShowPost({Key? key, required this.post}) : super(key: key);

  @override
  State<ShowPost> createState() => _ShowPostState();
}

class _ShowPostState extends State<ShowPost> {
  Blog? blog = null;
  List<Note> notes = [];

  int counterLike = 0;
  int counterReBlog = 0;
  int counterComment = 0;
  Map<String, dynamic>? bbb;
  @override
  void initState() {
    _getBlog();

    super.initState();
  }

  _getComment() async {
    Map<String, dynamic>? note;
    if (widget.post.notesId != null)
      note = await getComments(widget.post.notesId!) as Map<String, dynamic>?;
    print("noteid=${widget.post.notesId}notesssssssssss=$note");
    if (note != null) {
      List<dynamic>? n = note["res"]["notes"];

      if (n != null) {
        if (n.length != 0) {
          for (var i = 0; i < n.length; i++) {
            notes.add(Note.fromJson(n[i]));
            if (notes[i].noteType == "comment" &&
                notes[i].isDeleted == false &&
                notes[i].text != null) counterComment++;
            if (notes[i].noteType == "like" && notes[i].isDeleted == false)
              counterLike++;
            if (notes[i].noteType == "reblog" && notes[i].isDeleted == false)
              counterReBlog++;
          }
        }
      }
    }
  }

  _getBlog() async {
    Map<String, dynamic> bb =
        await getBlog(widget.post.blogId) as Map<String, dynamic>;

    Map<String, dynamic>? b1 = bb["res"]["data"];

    if (b1 != null && b1 != '') {
      blog = Blog.fromJson(b1);
      await _getComment();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return blog == null
        ? Container()
        : Column(
            children: [
              TextButton(
                onPressed: () {
                 
                },
                child: Row(
                  children: [
                    GetNetworkImage(
                        imageUrl: (blog!.avatar!) != null
                            ? blog!.avatar! != "default"
                                ? blog!.avatar! as String
                                : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"
                            : "https://wallpapertops.com/walldb/original/5/9/b/56244.jpg"),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .03),
                      child: ShowNameUser(
                        name: blog!.title != null
                            ? blog!.title as String
                            : "error",
                      ),
                    )),
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        reportSheet(context);
                      },
                      child: Icon(
                        Icons.more_horiz,
                        color: IconTheme.of(context).color,
                      ),
                    )
                  ],
                ),
              ),
              Html(
                data: widget.post.postHtml,
              ),
              ButtonsPost(
                post: widget.post,
                counterLike: counterLike,
                counterReBlog: counterReBlog,
                notes: notes,
                counterComment: counterComment,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .02,
                color: Colors.black,
              )
            ],
          );
  }
}
